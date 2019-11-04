//
//  HebrewKeyboardView.swift
//  Daven4Me
//
//  Created by user on 6/16/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

// This class will be the input view and will be a container
// around the hebrewKeyboard view
class ContainView: UIView, UIInputViewAudioFeedback {
  
    
  
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    var enableInputClicksWhenVisible: Bool {
        return true
    }
    
    func playInputClick() {
        UIDevice.current.playInputClick()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}


protocol HebrewKeyboardViewDelegate: class {
    func insertCharacter(_ newCharacter: String)
    func deleteCharacterBeforeCursor()
    func characterBeforeCursor() -> String?
    func saveButtonPressed()
}

class HebrewKeyboardView: UIView  {

    
    @IBOutlet weak var keyboardCollectionView: UICollectionView!
    
    var containView = ContainView()
    
    weak var delegate: HebrewKeyboardViewDelegate?
    
    
    let hebLetter = [
        "➜","א","ב","ג","ד","ה","ו‍","ז","ח"
        ,"ט","י","כ","ך","ל","מ","ם","נ","ן","ס","ע","פ","ף","צ",
         "ץ","ק","ר","ש","ת"
    ]
    
    let sect2Strings = ["↪︎","space","save"]
    
     fileprivate let cellId = "cellId"
    
 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
      
        
        keyboardCollectionView.isScrollEnabled = false
        keyboardCollectionView.semanticContentAttribute = .forceRightToLeft
        keyboardCollectionView.dataSource = self
        keyboardCollectionView.delegate = self
        keyboardCollectionView!.register(KeyCell.self, forCellWithReuseIdentifier: cellId)
        keyboardCollectionView.pinEdgesToSuperview()
        
    }
}

extension HebrewKeyboardView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case (0):
            return hebLetter.count
        default:
            return sect2Strings.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case (0):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! KeyCell
            
            let letter = hebLetter[indexPath.item]
            let customFont = UIFont(name: "SBLHebrew", size: 34)
            cell.digitsLabel.font = customFont
            cell.digitsLabel.text = letter
            return cell
            
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! KeyCell
            
            let letter = sect2Strings[indexPath.item]
            let customFont = UIFont(name: "SBLHebrew", size: 24)
            cell.digitsLabel.font = customFont
            cell.digitsLabel.text = letter
            return cell
        }
    }
}


extension HebrewKeyboardView: UICollectionViewDelegate  {
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        containView.playInputClick()
        
        
        
        // back space pressed.. delete char before cursor
        if  indexPath.section == 0 &&  indexPath.item == 0 {
            //textField.deleteBackward()
            delegate?.deleteCharacterBeforeCursor()
            
        }
            
            // letter tapped.. insert at cursor point
        else if indexPath.section == 0 && indexPath.item > 0 {
            let selectedLetter = hebLetter[indexPath.item]
            delegate?.insertCharacter(selectedLetter)
         
        }
        // space button pressed insert at cursor
        else if indexPath.section == 1 && indexPath.item == 1 {
            
            let currentLetter = "-"
            delegate?.insertCharacter(currentLetter)
            
            // save button pressed
            // condition 1... nothing changed
        } else if indexPath.section == 1 && indexPath.item == 2 {
            
            delegate!.saveButtonPressed()
          
        }
    }
                
}
extension HebrewKeyboardView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var  size = CGSize(width: 46, height: 58)
        switch indexPath.section {
        case (0):
            return  size
        default:
            size = CGSize(width: 96, height: 68)
            return size
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        switch section {
        case 0:
            
            return UIEdgeInsets(top: 4, left: 4, bottom: 0, right: 4)
            
        default:
            
            //let leftRightPadding = self.frame.width * 0.05
            return .init(top: 10, left: 16, bottom: 0, right: 16)
        }
    }
}
