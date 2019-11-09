//
//  ViewController.swift
//  Daven4Me
//
//  Created by user on 6/14/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    
    var dataModel =  DataModel()
    
    let cellIdentifier = "NameTableViewCell"
    
    let personService = PersonService()
    var people = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.view.semanticContentAttribute = .forceRightToLeft
        navigationController?.navigationBar.semanticContentAttribute = .forceRightToLeft
    }
    
    // MARK:- Table View DataSource and Delegates
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.peopleArray.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! NameTableViewCell
        
        let person = dataModel.peopleArray[indexPath.row]
        cell.nameLabel.text = person.nameToDisplay
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let controller = storyboard!.instantiateViewController(withIdentifier: "AddEditViewController") as! AddEditViewController
        controller.delegate = self
        let person = dataModel.peopleArray[indexPath.row]
        controller.personToEdit = person
        present(controller, animated: true, completion: nil)
        
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
         
        let selectedPerson = dataModel.peopleArray[indexPath.row]
        controller.selectedPerson = selectedPerson
        
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
        tableView.reloadData()
    }
    
    func addEditViewController(_ controller: AddEditViewController, didFinishEditing person: Person) {
        
        // let index = dataModel.peopleArray.index(of: person)!
        //dataModel.peopleArray[index] = person
        
        tableView.reloadData()
    }
    
    func addEditViewController(_ controller: AddEditViewController, didFinishDeleting person: Person) {
        
        let index = dataModel.peopleArray.index(of: person)
        dataModel.peopleArray.remove(at: index!)
       
        let indexPath = IndexPath(row: index!, section: 0)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
}
    


