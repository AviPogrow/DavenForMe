//
//  CustomInputView.swift
//  TextFieldMania
//
//  Created by user on 12/5/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

// The view controller will adopt this protocol (delegate)
// and thus must contain the keyWasTapped method
protocol CustomInputViewDelegate: class {
    func keyWasTapped(character: String)
    func keyDone()
    func backspace()
}

class CustomInputView: UIView {

   
       // This variable will be set as the view controller so that
       // the keyboard can send messages to the view controller.
       weak var delegate: CustomInputViewDelegate?

       // MARK:- keyboard initialization

       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
          // initializeSubviews()
       }
    

    override func awakeFromNib() {
      super.awakeFromNib()
        initializeSubviews()
          setColorScheme()
        
    }

       override init(frame: CGRect) {
           super.init(frame: frame)
           initializeSubviews()
          setColorScheme()
       }

       func initializeSubviews() {
           let xibFileName = "CustomInputView" // xib extention not included
           let view = Bundle.main.loadNibNamed(xibFileName, owner: self, options: nil)![0] as! UIView
           self.addSubview(view)
           view.frame = self.bounds
        view.backgroundColor = UIColor.clear
       }
    
    func setColorScheme() {
        for view in subviews {
            if let button = view as? UIButton {
                button.backgroundColor = UIColor.white
                
            }
        }
        
    }
    
    
    
    

       // MARK:- Button actions from .xib file

       @IBAction func keyTapped(sender: UIButton) {
           // When a button is tapped, send that information to the
           // delegate (ie, the view controller)
           self.delegate?.keyWasTapped(character: sender.titleLabel!.text!) // could alternatively send a tag value
       }
   
    
    @IBAction func savePressed(_ sender: Any) {
         self.delegate?.keyDone()
    }
    
    
    @IBAction func backspace(sender: UIButton) {
        self.delegate?.backspace()
    }

   }


