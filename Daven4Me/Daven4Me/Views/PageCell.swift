//
//  PageCell.swift
//  autolayout_lbta
//
//  Created by Brian Voong on 10/12/17.
//  Copyright © 2017 Lets Build That App. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
  
    
    @IBOutlet weak var tehillim1TextView: UITextView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        
        setupViews()
       
        
    }
    
    func setupViews() {
        tehillim1TextView.backgroundColor = UIColor.white 
               tehillim1TextView.isEditable = false
               tehillim1TextView.isSelectable = false
           
           tehillim1TextView.makeTextWritingDirectionRightToLeft(self)
            tehillim1TextView.textAlignment = .right
            tehillim1TextView.semanticContentAttribute = .forceRightToLeft
            
            // add padding to the page cell inside the collectionView
            //
            let inset = UIEdgeInsets(top: 8 , left: 64, bottom: 8, right: 64)
            
            // add some padding around the text inside the text view
            let textInset = UIEdgeInsets(top: 0, left: 16, bottom: 16, right: 16)
            
        tehillim1TextView.textContainerInset = textInset
        
      
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
          
   
 
   
  
   
    

