//
//  KeyboardViewController.swift
//  SimpleHebrewKeyboard
//
//  Created by user on 6/18/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    var hebrewKeyboardView: HebrewKeyboardView!
     var keyboardContainView = ContainView()

    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        primaryLanguage = "he-IL"
        
        let nib = UINib(nibName: "HebrewKeyboardView", bundle: nil)
        let objects = nib.instantiate(withOwner: nil, options: nil)
        hebrewKeyboardView = objects.first as? HebrewKeyboardView
        
        hebrewKeyboardView.backgroundColor = UIColor.black
        
        
        guard let inputView = inputView else { return }
        
        inputView.addSubview(hebrewKeyboardView)
        
        // 3
        
        hebrewKeyboardView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hebrewKeyboardView.leftAnchor.constraint(equalTo: inputView.leftAnchor),
            hebrewKeyboardView.topAnchor.constraint(equalTo: inputView.topAnchor),
            
            hebrewKeyboardView.rightAnchor.constraint(equalTo: inputView.rightAnchor),
            hebrewKeyboardView.bottomAnchor.constraint(equalTo: inputView.bottomAnchor)
            ])
        
       
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
 
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
       
        let heightConstraint = self.view.heightAnchor.constraint(equalToConstant: 350)
        view.addConstraint(heightConstraint)
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
    
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        //var textColor: UIColor = UIColor.white
        //let proxy = self.textDocumentProxy
       // if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
        //    textColor = UIColor.white
       // } else {
        //    textColor = UIColor.black
       // }
       // self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }

}
