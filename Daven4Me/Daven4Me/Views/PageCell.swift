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
           //print("the page cell's direction is \(effectiveUserInterfaceLayoutDirection)")
           tehillim1TextView.isEditable = false
           tehillim1TextView.isSelectable = false
       
       tehillim1TextView.makeTextWritingDirectionRightToLeft(self)
        tehillim1TextView.textAlignment = .right
        tehillim1TextView.semanticContentAttribute = .forceRightToLeft
        
        let inset = UIEdgeInsets(top: -4 , left: 16, bottom: 8, right: 16)
        
        addSubview(tehillim1TextView)
      
        tehillim1TextView.fillSuperview(padding: inset)
       }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
       super.layoutSubviews()
      
   }
    
    func addNewLineToEachSentence(paragraph: String) -> String {
           var newString = " "
           var lastSentenceIndex = paragraph.startIndex
           
           for i in paragraph.indices {
               
               if paragraph[i] == ":" {
                   
                   // range from start to ":"
                let  subString = paragraph[lastSentenceIndex...i]
                   
                   // add a new line character to substring
                   newString = newString + subString + "\n \n"
                                                
                   //update the index to after the ":"
                   lastSentenceIndex = paragraph.index(after: i)
                   
               }
           }
           
           return newString
       }
 
            
}
          
   
 
   
  
   
    

