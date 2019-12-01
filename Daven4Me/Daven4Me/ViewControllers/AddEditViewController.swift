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

class AddEditViewController: UIViewController {

    
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
    @IBOutlet weak var containerView: UIView!
    
    var hebrewKeyboardView: HebrewKeyboardView!
    
    
    fileprivate let cellId = "cellId"
    var displayString: String = ""
    
    weak var delegate: AddEditViewControllerDelegate?
    
    var personToEdit : Person?
    
    var keyboardContainView = ContainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       configureTextField()
        
    }
    
    func configureTextField() {
        
        if personToEdit != nil {
            textField.text = personToEdit?.nameToDisplay
        } else {
            textField.text =  "בן"
        }
        
        textField.semanticContentAttribute = .forceRightToLeft
        textField.adjustsFontSizeToFitWidth = true
        textField.delegate = self
        
        let _ = "he-IL"
        
        textField.textAlignment = .center
        
        // Set keyboard view to input view of text field
        let nib = UINib(nibName: "HebrewKeyboardView", bundle: nil)
        let objects = nib.instantiate(withOwner: nil, options: nil)
        
        hebrewKeyboardView = objects.first as? HebrewKeyboardView
        hebrewKeyboardView.delegate = self
        
        // Add the keyboard to a container view so that it's sized correctly
        keyboardContainView.frame = hebrewKeyboardView.frame
        
        keyboardContainView.addSubview(hebrewKeyboardView)
        
        textField.inputView = keyboardContainView
        
        // Add KVO for textfield to determine when cursor moves
        textField.addObserver(self, forKeyPath: "selectedTextRange", options: .new, context: nil)
    }
    
    func configureTextField(textField: UITextField) {
           
           textField.text =  "בן"
           textField.semanticContentAttribute = .forceRightToLeft
           textField.adjustsFontSizeToFitWidth = true
           textField.delegate = self

           let _ = "he-IL"
           textField.textAlignment = .right
           
           var hebrewKeyboardView = HebrewKeyboardView()
           
           // Set keyboard view to input view of text field
           let nib = UINib(nibName: "HebrewKeyboardView", bundle: nil)
           let objects = nib.instantiate(withOwner: nil, options: nil)
           
           hebrewKeyboardView = objects.first as! HebrewKeyboardView
           //hebrewKeyboardView.delegate = self as! HebrewKeyboardViewDelegate
           
        let keyboardContainView = ContainView()
           // Add the keyboard to a container view so that it's sized correctly
           keyboardContainView.frame = hebrewKeyboardView.frame
           keyboardContainView.addSubview(hebrewKeyboardView)
           
           textField.inputView = keyboardContainView
           
           // Add KVO for textfield to determine when cursor moves
           textField.addObserver(self, forKeyPath: "selectedTextRange", options: .new, context: nil)
       }
    
    // deal with changes in cursor position
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "selectedTextRange" {
           // do something when cursor changes
        }
    }
    
   
    deinit {
        NotificationCenter.default.removeObserver(self)
        textField.removeObserver(self, forKeyPath: "selectedTextRange")
    }
    
   
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        textField.becomeFirstResponder()
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        textField.resignFirstResponder()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func trashTapped(_ sender: Any) {
        if personToEdit != nil {
            delegate?.addEditViewController(self, didFinishDeleting: personToEdit!)
            dismiss(animated: true, completion: nil)
        }
    }
}

extension AddEditViewController: HebrewKeyboardViewDelegate {
    func insertCharacter(_ newCharacter: String) {
        textField.insertText(newCharacter)
        
        
    }
    
    func deleteCharacterBeforeCursor() {
        textField.deleteBackward()
    }
    
    func characterBeforeCursor() -> String? {
        // get the cursor position
        if let cursorRange = textField.selectedTextRange {
            // get the position one character before the cursor start position
            if let newPosition = textField.position(from: cursorRange.start, offset: -1),
                let range = textField.textRange(from: newPosition, to: cursorRange.start) {
                return textField.text(in: range)
            }
        }
        return nil
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
}

extension AddEditViewController: UITextFieldDelegate  {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
     return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
      textField.textColor = UIColor.black
    }
 
}






    

