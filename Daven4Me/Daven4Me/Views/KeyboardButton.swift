//
//  KeyboardButton.swift
//  TextFieldMania
//
//  Created by user on 12/6/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

class KeyboardButton: UIButton {
    
    var defaultBackgroundColor: UIColor = .white
     var highlightBackgroundColor: UIColor = .lightGray
    

    override init(frame: CGRect) {
      super.init(frame: frame)
      commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      commonInit()
    }
    

     func commonInit() {
      titleLabel?.backgroundColor = UIColor.white
        
        
      backgroundColor = UIColor.white
      layer.cornerRadius = 5.0
      layer.masksToBounds = false
      layer.shadowOffset = CGSize(width: 0, height: 1.0)
      layer.shadowRadius = 0.0
      layer.shadowOpacity = 0.35
    }
    
    
    override func layoutSubviews() {
      super.layoutSubviews()
      
      backgroundColor = isHighlighted ? highlightBackgroundColor : defaultBackgroundColor
    }

}
