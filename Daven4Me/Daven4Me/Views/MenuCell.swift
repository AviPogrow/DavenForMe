//
//  MenuCell.swift
//  autolayout_lbta
//
//  Created by user on 5/8/19.
//  Copyright © 2019 Lets Build That App. All rights reserved.
//
import UIKit

class MenuCell: UICollectionViewCell {
    
let lettrLabel = UILabel()
    
    var letter: String? {
        
        didSet {
          guard let letter = letter else { return }
          lettrLabel.text = letter
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.borderWidth = 0.2
        layer.borderColor = UIColor.lightGray.cgColor
        //layer.cornerRadius = 0.0
        
        
        layer.cornerRadius = 4.0
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 0.2, height: 0.2)
        layer.shadowRadius = 0.2
        layer.shadowOpacity = 0.82
        
        
        
       
    }
    
    override var isSelected: Bool {
        didSet {
         
        lettrLabel.backgroundColor = isSelected ? UIColor.black : UIColor.white
        lettrLabel.textColor = isSelected ? UIColor.white: UIColor.black
        //lettrLabel.layer.borderWidth = 1.0
        lettrLabel.layer.borderColor = isSelected ? UIColor.black.cgColor: UIColor.white.cgColor
            
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        
        let textColor = UIColor.black
        lettrLabel.textColor = textColor
        //lettrLabel.backgroundColor = UIColor.lightText
        lettrLabel.textAlignment = .center
        //lettrLabel.font = UIDevice.current.screenType == .iPhones_5_5s_5c_SE ? .systemFont(ofSize: 34) : .systemFont(ofSize: 34)
        
        addSubview(lettrLabel)
        //lettrLabel.frame = bounds
        lettrLabel.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  }


