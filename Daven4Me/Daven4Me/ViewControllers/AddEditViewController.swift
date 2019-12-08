//
//  AddEditViewController.swift
//  Daven4Me
//
//  Created by user on 6/14/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

protocol AddEditViewControllerDelegate: class {
  func addEditViewController(_ controller: AddEditViewController, didFinishAdding person: Person)
  func addEditViewController(_ controller: AddEditViewController, didFinishEditing person: Person)
  func addEditViewController(_ controller: AddEditViewController, didFinishDeleting person: Person)
}

class AddEditViewController: UIViewController, CustomInputViewDelegate {
    
    

    
    // Array of Letters to Populate the Keyboard
    let chars = HebrewData.LetterHebrew.allCases[0...5]
    
    // Alternatively use this array as data source for input view
    
    let hebLetter = [
        "➜","א","ב","ג","ד","ה","ו‍","ז","ח"
        ,"ט","י","כ","ך","ל","מ","ם","נ","ן","ס","ע","פ","ף","צ",
         "ץ","ק","ר","ש","ת"
    ]
    
     let avi = "שגששגדקכקהבגגגבש"
    let אב׳ = "avi"
    
    let אבי  =  "שגששגדקכקהבגגגבש"
    
    
    let sect2Strings = ["↪︎","space","save"]
    
    @IBOutlet weak var textField: UITextField!
    
    
    
    
    fileprivate let cellId = "cellId"
    var displayString: String = ""
    
    weak var delegate: AddEditViewControllerDelegate?
    
    var personToEdit : Person?
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       configureTextField()
        
    }
    
    func configureTextField() {
        
        if personToEdit != nil {
            textField.text = personToEdit?.nameToDisplay
        } else {
          
        }
        
       
        textField.makeTextWritingDirectionRightToLeft(self)
        textField.adjustsFontSizeToFitWidth = true
       
        
       
        let customFont = UIFont(name: "SBLHebrew", size: 34)
        textField.font = customFont
        textField.textAlignment = .center
        
     
        let customInputView = CustomInputView(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
        // set container view to the be the input view for
        // textField
        customInputView.delegate = self // the view controller will be notified by the keyboard whenever a key is tapped
        // replace system keyboard with custom keyboard
        textField.inputView = customInputView
        
        
     
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
        textField.becomeFirstResponder()
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        textField.resignFirstResponder()
        dismiss(animated: true, completion: nil)
    }
    

    func saveButtonPressed() {
        
         // if user hits add new person but never enters text
         if  (personToEdit == nil)  && (textField.text?.isEmpty)! {
        
             textField.resignFirstResponder()
             dismiss(animated: true, completion: nil)
          }
        
        
        // if user is editing and he deletes all the chars
        // that is like deleteing the object
          if personToEdit != nil && (textField.text?.isEmpty)! {
        
                delegate?.addEditViewController(self, didFinishDeleting: personToEdit!)
            
            textField.resignFirstResponder()
            dismiss(animated: true, completion: nil)
        
        }
        
        // if we were editing an existing person
        // and textField is not empty
        // update the object and tell the delegate
          if  personToEdit != nil && !(textField.text?.isEmpty)! {
        
            // use the person service class to convert the
            // name into computed properties to pass to
            // update the property values of personToEdit
            let personService = PersonService()
            let lettersArray = (personService.createLettersArrayFromName(name: textField.text!))
            let dictKeysArray = personService.createKeyArrayFromLettersArray(arrayOflettrs: lettersArray)
            
            let kapitelStringsArray = personService.convertKeyArryToKapitArray(kapitlKeys: dictKeysArray)
            
           
            // update the properties of personToEdit
            personToEdit?.nameToDisplay = textField.text!
            personToEdit?.lettersArray = lettersArray
            personToEdit?.keysForDict = dictKeysArray
            personToEdit?.kapitelStringsArray = kapitelStringsArray
            
            delegate?.addEditViewController(self, didFinishEditing: personToEdit!)
            
            textField.resignFirstResponder()
            dismiss(animated: true, completion: nil)
        }
        
        
        //if edited object is nil we are creating a new object
        if  personToEdit == nil && !(textField.text?.isEmpty)! {
        
            let personService = PersonService()
            let person = personService.createNewPersonFromName(name: textField.text!)
            
            delegate?.addEditViewController(self, didFinishAdding: person)
            
            textField.resignFirstResponder()
            
            dismiss(animated: true, completion: nil)
            }
    }
    
    
    func keyWasTapped(character: String) {
         textField.insertText(character)
    }
    
    func keyDone() {
         view.endEditing(true)
        saveButtonPressed()
    }
    
    func backspace() {
        textField.deleteBackward()
    }
}

extension AddEditViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        return true
    }
}






    

