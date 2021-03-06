//
//  ViewController.swift
//  Daven4Me
//
//  Created by user on 6/14/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit
import MBProgressHUD



protocol PersonSelectionDelegate: class {
  func personSelected(_ newPerson: Person)
}


class MasterViewController: UITableViewController, UINavigationControllerDelegate {
    
    weak var delegate: PersonSelectionDelegate?

    @IBOutlet weak var addButton: UIBarButtonItem!
    
    var dataModel =  DataModel()
    
    let cellIdentifier = "NameTableViewCell"
    
    let personService = PersonService()
    var people = [Person]()
    
    weak var splitViewDetail: NameDetailViewController?
    
     let segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["All","Loved Ones","Cholim","Yahrzeits"])
        sc.selectedSegmentIndex = 0
        sc.addTarget(self, action: #selector(handleSegmentChange), for: .valueChanged)
        return sc
    }()
    
   
    
    @objc fileprivate func handleSegmentChange() {
       // print(segmentedControl.selectedSegmentIndex)
        /*
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            rowsToDisplay = games
        case 1:
            rowsToDisplay = tvShows
        default:
            rowsToDisplay = devices
        }
        
        tableView.reloadData()
     */
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        
          navigationController?.title = "Mispalelis"
        //customize text display on nav bar
          let textColor = UIColor.red
        let font = UIFont(name: "Rockwell", size: 24.0)
        let attributes: [NSAttributedString.Key: Any] = [
                    .foregroundColor: textColor,
                    .font: font as Any]
         navigationController?.navigationBar.titleTextAttributes = attributes
        navigationItem.title = "Mispalelis"
       
        let insets = UIEdgeInsets(top: 58, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.backgroundColor = UIColor.groupTableViewBackground
        
        
       
        
        let segmentControlRect = CGRect(x: 16, y: -48, width: view.bounds.width - 24, height: segmentedControl.frame.height)
        segmentedControl.frame = segmentControlRect
        view.addSubview(segmentedControl)
       
      }
    
    // if view controller is collapsed then clear selection
    // of tableView
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if dataModel.peopleArray.count > 0 {
        // select the first person on the list
        let firstIndex = 0
        let firstIndexPath = IndexPath(row: firstIndex, section: 0)
        let firstPerson = dataModel.peopleArray[0]
        delegate!.personSelected(firstPerson)
        
        tableView.selectRow(at: firstIndexPath  , animated: false, scrollPosition: .top)
            //showLoadingHUD()
        }
    }
    
    private func showLoadingHUD() {
       let hud = MBProgressHUD.showAdded(to: tableView, animated: true)
       hud.label.text = "Loading..."
     }

     private func hideLoadingHUD() {
       MBProgressHUD.hide(for: tableView, animated: true)
     }
    
   
    // in portrait mode when a cell is selectedd hide the
    // master pane
    private func hideMasterPane() { UIView.animate(withDuration: 0.25, animations: {
        
    // hide the master pane
    self.splitViewController!.preferredDisplayMode =
    .primaryHidden
    }, completion: { _ in
        
        // but don't keep the master pane hidden
        self.splitViewController!.preferredDisplayMode = .automatic
    }) }
    
    
  
 
    
    // MARK:- Table View DataSource and Delegates
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.peopleArray.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
   
        return tableView.superview!.bounds.maxY / 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! NameTableViewCell
        
        let person = dataModel.peopleArray[indexPath.row]
        
       
        cell.nameLabel.text = person.nameToDisplay
        
        // generate special unicode string for bi directional
        // line of text
        let userTimeIntString = insertDirectionIsolates(userName: person)
        
        cell.timeIntervalLabel.text = userTimeIntString
        return cell
    }
    
   
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
       let navController = storyboard!.instantiateViewController(withIdentifier: "AddEditNavController") as! UINavigationController
        let addEditController = navController.topViewController as! AddEditViewController
        addEditController.delegate = self
        
        let person = dataModel.peopleArray[indexPath.row]
        addEditController.personToEdit = person
        
        present(navController, animated: true, completion: nil)
        }
    
    
    //keep track if view controller is in edit mode the user can't open the nameEditor scene
      override func setEditing(_ editing: Bool, animated: Bool) {
          super.setEditing(editing, animated: animated)
          
          if editing {
           addButton.isEnabled = false
           } else {
           addButton.isEnabled = true
           }
      }
    
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let index = indexPath.row
        dataModel.peopleArray.remove(at: index)
        
        let indexPath = IndexPath(row: index, section: 0)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    
   
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if isEditing {
            return
        } else {
        
        // get the selected person
        let selectedPerson = dataModel.peopleArray[indexPath.row]
            
        // tell the delegate i.e. detailViewController
        // that a person was selected and it needs to
        // update its views
        delegate?.personSelected(selectedPerson)
        
        
        if
        let detailViewController = delegate as? NameDetailViewController,
            
         let detailNavigationController = detailViewController.navigationController {
            splitViewController?.showDetailViewController(detailNavigationController, sender: nil)
            }
           
        }
    }

    @IBAction func addNameTapped(_ sender: Any) {
        
        let navController = storyboard!.instantiateViewController(withIdentifier: "AddEditNavController") as! UINavigationController
        let addEditController = navController.topViewController as! AddEditViewController
        addEditController.delegate = self
        
        present(navController, animated: true, completion: nil)
    }
    
    // MARK:- Navigation Controller Delegates
     func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
       if viewController === self {
         dataModel.indexOfSelectedPerson = -1
       }
     }
    
    
}
    
extension MasterViewController: AddEditViewControllerDelegate {
    
    func addEditViewController(_ controller: AddEditViewController, didFinishAdding person: Person) {
        
        dataModel.peopleArray.append(person)
        sortPeopleArray()
        tableView.reloadData()
    }
    
    func sortPeopleArray() {
        dataModel.peopleArray.sort(by: { list1, list2 in
            return list1.timeStamp.compare(list2.timeStamp) == .orderedDescending })
    }
    
    func addEditViewController(_ controller: AddEditViewController, didFinishEditing person: Person) {
        
        tableView.reloadData()
    }
    
    func addEditViewController(_ controller: AddEditViewController, didFinishDeleting person: Person) {
        
        let index = dataModel.peopleArray.firstIndex(of: person)
        dataModel.peopleArray.remove(at: index!)
       
        let indexPath = IndexPath(row: index!, section: 0)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
}
    


