//
//  NameTableViewCell.swift
//  Daven4Me
//
//  Created by user on 6/15/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

class NameTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var timeIntervalLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let customFont = UIFont(name: "SBLHebrew", size: 30)
        nameLabel.font = customFont
        nameLabel.textAlignment = .right
        nameLabel.semanticContentAttribute = .forceRightToLeft
        nameLabel.adjustsFontSizeToFitWidth = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.borderWidth = 1.75
        layer.borderColor = UIColor.darkGray.cgColor
        //layer.cornerRadius = 25.0
        //layer.masksToBounds = true
       
        //layer.shadowRadius = 5.0
        //layer.shadowOpacity = 0.33
        
    }
}
