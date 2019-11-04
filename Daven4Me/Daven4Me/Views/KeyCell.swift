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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = 7.0
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        layer.shadowRadius = 1.0
        layer.shadowOpacity = 0.85
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


