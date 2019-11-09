//
//  KeyCell.swift
//  NumPadLBTA
//
//  Created by Brian Voong on 3/19/19.
//  Copyright © 2019 Brian Voong. All rights reserved.
//

import UIKit

class KeyCell: UICollectionViewCell {
    
    let digitsLabel = UILabel()
    let lettersLabel = UILabel()
    
    // give  a grey background color
    //fileprivate let defaultBGColor = UIColor(white: 0.9, alpha: 1)
      fileprivate let defaultBGColor = UIColor.white
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? .darkGray : defaultBGColor
            digitsLabel.textColor = isHighlighted ? .white : .black
            lettersLabel.textColor = isHighlighted ? .white : .black
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = defaultBGColor
        
        digitsLabel.text = "8"
        
        //digitsLabel.font = UIDevice.current.screenType == .iPhones_5_5s_5c_SE ? .systemFont(ofSize: 24) : .systemFont(ofSize: 36)
        
         //let customFont = UIFont(name: "SBLHebrew", size: 34)
        
        
        //digitsLabel.font = UIFontMetrics.default.scaledFont(for: customFont)
        //digitsLabel.adjustsFontForContentSizeCategory = true
        
        //digitsLabel.font = UIFontMetrics.default.scaledFont(for: customFont)
        
        digitsLabel.textAlignment = .center
        
        digitsLabel.frame = bounds
        addSubview(digitsLabel)
        
    }
    
     override var isSelected: Bool {
        didSet {
         
        digitsLabel.backgroundColor = isSelected ? UIColor.black : UIColor.white
        
            digitsLabel.textColor = isSelected ? UIColor.white: UIColor.black
        //lettrLabel.layer.borderWidth = 1.0
        
            digitsLabel.layer.borderColor = isSelected ? UIColor.black.cgColor: UIColor.white.cgColor
            
             //layer.borderWidth = isSelected ?
              //  3.0 : 1.0
            
            layer.cornerRadius = isSelected ?
                3.0 : 3.0
            layer.masksToBounds =  isSelected ?
                false : false
            
          //  lettrLabel.layer.borderWidth = 2.1
        //layer.borderColor = UIColor.lightGray.cgColor
        //layer.cornerRadius = 0.0
            
            
            //layer.cornerRadius = 3.0
            //layer.masksToBounds = false
           // layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
            //layer.shadowRadius = 0.5
              //    layer.shadowOpacity = 0.85
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = 3.0
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        layer.shadowRadius = 1.0
        layer.shadowOpacity = 0.85
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


