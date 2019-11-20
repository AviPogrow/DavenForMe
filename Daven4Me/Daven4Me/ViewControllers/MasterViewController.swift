//
//  ViewController.swift
//  Daven4Me
//
//  Created by user on 6/14/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    var dataModel =  DataModel()
    
    let cellIdentifier = "NameTableViewCell"
    
    let personService = PersonService()
    var people = [Person]()
    

    
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
          navigationController?.title = "Mispalelis"
        //customize text display on nav bar
          let textColor = UIColor.red
        
       
        let font = UIFont(name: "Rockwell", size: 24.0)
        let attributes: [NSAttributedString.Key: Any] = [
                    .foregroundColor: textColor,
                    .font: font as Any]
        
        
        navigationItem.leftBarButtonItem = editButtonItem
        navigationItem.title = "Mispalelis"
        navigationController?.navigationBar.titleTextAttributes = attributes
        
        navigationController?.view.semanticContentAttribute = .forceRightToLeft
        navigationController?.navigationBar.semanticContentAttribute = .forceRightToLeft
        
        
       
        //tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .zero)
        
        //let tableView = UITableView(frame: .zero, style: .plain)
        
        // let paddedStackView = UIStackView(arrangedSubviews: [segmentedControl])
        //paddedStackView.layoutMargins = .init(top: 12, left: 12, bottom: 6, right: 12)
        //paddedStackView.isLayoutMarginsRelativeArrangement = true
        
        ///let stackView = UIStackView(arrangedSubviews: [
         //   paddedStackView, tableView
         //   ])
        //stackView.axis = .vertical
        let insets = UIEdgeInsets(top: 58, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.backgroundColor = UIColor.groupTableViewBackground
        let segmentControlRect = CGRect(x: 16, y: -48, width: view.bounds.width - 24, height: segmentedControl.frame.height)
        segmentedControl.frame = segmentControlRect
        view.addSubview(segmentedControl)
        //stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .zero)
        
        // scale tableView to its intrinsic content
        //tableView.rowHeight = UITableView.automaticDimension
        //tableView.estimatedRowHeight = 175
        
        
        //3. get the value for the key "indexOfSelectedChecklist"
            let index = dataModel.indexOfSelectedMispaleli
            
        
            //if index is NOT -1 then we need to segue
            if index != -1 {
            
            let indexPath = IndexPath(row: index, section: 0)
           
            let person = dataModel.peopleArray[indexPath.row]
              
            let controller = storyboard!.instantiateViewController(withIdentifier: "NameDetailViewController") as! NameDetailViewController
                
            controller.dataModel = dataModel
            controller.selectedPerson = person
                
            navigationController?.pushViewController(controller, animated: true)
        }
        
        
    }
    
    
    
    
    
    // MARK:- Table View DataSource and Delegates
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.peopleArray.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
   
        return view.bounds.height / 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! NameTableViewCell
        
        let person = dataModel.peopleArray[indexPath.row]
        
        let timeInterval = person.timeStamp.timeAgoDisplay()
   
        let font = UIFont.systemFont(ofSize: 18)
        let customFontName = "SBLHebrew"
        let customFont = UIFont(name: customFontName, size: 16)
        let textColor = UIColor.red
        
        // add unicode directional character
        let lightWeightLTR = "\u{200E}"

        let aviStringHeb = "אברהם"
    
        let addedBy = "added by - "
        let userName = aviStringHeb
        let timeInterv = timeInterval
        let spaceDashSpace = " - "

        let strongRTLIsolate = "\u{2066}"

        let aviString2 = "\(strongRTLIsolate)" + " " + addedBy + "\(aviStringHeb)" + spaceDashSpace + "\(strongRTLIsolate)" + " " + timeInterv

        let range = NSMakeRange(10, 11)
        cell.nameLabel.text = person.nameToDisplay
        
        cell.timeIntervalLabel.text = aviString2
        return cell
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let controller = storyboard!.instantiateViewController(withIdentifier: "AddEditViewController") as! AddEditViewController
        controller.delegate = self
        let person = dataModel.peopleArray[indexPath.row]
        controller.personToEdit = person
        present(controller, animated: true, completion: nil)
        
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
      if !isEditing {
        let controller = storyboard!.instantiateViewController(withIdentifier: "NameDetailViewController") as! NameDetailViewController
         
        dataModel.indexOfSelectedMispaleli = indexPath.row
        
        let selectedPerson = dataModel.peopleArray[indexPath.row]
        controller.selectedPerson = selectedPerson
        
        DispatchQueue.main.async {
                   tableView.deselectRow(at: indexPath, animated: true)
               }
        
        //if selectedPerson.lettersArray.count > 0  {
        navigationController?.pushViewController(controller, animated: true)
         // }
        }
     }

    @IBAction func addNameTapped(_ sender: Any) {
       let controller = storyboard!.instantiateViewController(withIdentifier: "AddEditViewController") as! AddEditViewController
        controller.delegate = self
        
        present(controller, animated: true, completion: nil)
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
        
        let index = dataModel.peopleArray.index(of: person)
        dataModel.peopleArray.remove(at: index!)
       
        let indexPath = IndexPath(row: index!, section: 0)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
}
    


