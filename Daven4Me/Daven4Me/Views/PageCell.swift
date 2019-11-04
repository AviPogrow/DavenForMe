//
//  PageCell.swift
//  autolayout_lbta
//
//  Created by Brian Voong on 10/12/17.
//  Copyright © 2017 Lets Build That App. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
  
    
    
    var  tehillim1TextView =  UITextView()
    
    var page: String? {
        
        didSet {
           guard let tehillimText = page else { return }
              let formattedString = addNewLineToEachSentence(paragraph: tehillimText)
             tehillim1TextView.text = formattedString
        }
    }
    
    override init(frame: CGRect) {
           super.init(frame: frame)
           
           tehillim1TextView.isEditable = false
           tehillim1TextView.isSelectable = false
        let customFont = UIFont(name: "SBLHebrew", size: 30)
        tehillim1TextView.font = customFont
       tehillim1TextView.makeTextWritingDirectionRightToLeft(self)
        tehillim1TextView.textAlignment = .right
        tehillim1TextView.semanticContentAttribute = .forceRightToLeft
        
        
        
        let inset = UIEdgeInsets(top:16 , left: 16, bottom: 8, right: 16)
        
        addSubview(tehillim1TextView)
      
        tehillim1TextView.fillSuperview(padding: inset)
       }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 
  
        
override func layoutSubviews() {
       super.layoutSubviews()
       layer.borderWidth = 1.50
       layer.borderColor = UIColor.lightGray.cgColor
   }
    
    func addNewLineToEachSentence(paragraph: String) -> String {
           var newString = " "
           var lastSentenceIndex = paragraph.startIndex
           
           for i in paragraph.indices {
               
               if paragraph[i] == ":" {
                   
                   // range from start to ":"
                   var  subString = paragraph[lastSentenceIndex...i]
                   
                   // add a new line character to substring
                   newString = newString + subString + "\n \n"
                                                
                   //update the index to after the ":"
                   lastSentenceIndex = paragraph.index(after: i)
                   
               }
           }
           
           return newString
       }
 
            
}
            /*
            let kapitelAlephComponents = tehillimText.components(separatedBy: ":").dropLast()
       var finalAttributedText = NSMutableAttributedString(string: "")
     
        for posuk in kapitelAlephComponents {
            
            //let firstIndex = posuk.startIndex
            //let firstLetter = posuk[firstIndex]
            
            // let secondIndex = posuk.index(posuk.startIndex, offsetBy: 1)
            //  let secondLetter = posuk[secondIndex]
            
            //  var firstLetterString = string(firstLetter)
            //  var secondLetterString = String(secondLetter)
        //Helvetica 11.0
        let font = UIFont.systemFont(ofSize: 20)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
      
        paragraphStyle.baseWritingDirection = .rightToLeft
        paragraphStyle.firstLineHeadIndent = 12.0
        paragraphStyle.headIndent = 16.0
       
        paragraphStyle.paragraphSpacingBefore = 0.0
    
        paragraphStyle.paragraphSpacing = 10
 
        let textColor = UIColor.black
        
        let attributes: [NSAttributedString.Key: Any] = [
                    .foregroundColor: textColor,
                    .font: font,
                    .paragraphStyle: paragraphStyle]
           
        // then add the paragraph style
        var attrbPosuk  = NSMutableAttributedString(string: "\n\(posuk):", attributes: attributes)
       
         finalAttributedText.append(attrbPosuk)
            }
            //tehillim1TextView.attributedText = finalAttributedText
        }
    }
    */
   
 
   
  
   
    

