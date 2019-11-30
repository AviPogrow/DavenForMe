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
        layer.borderWidth = 0.75
        layer.borderColor = UIColor.red.cgColor
        layer.cornerRadius = 25.0
        layer.masksToBounds = true 
        //layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 0.33
        
        //layer.masksToBounds = false
                // layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
                 //layer.shadowRadius = 0.5
                   //    layer.shadowOpacity = 0.85
        
        //nameLabel.layer.borderWidth = 0.3
        //nameLabel.layer.borderColor = UIColor.red.cgColor
        //nameLabel.layer.cornerRadius = 20.0
        //nameLabel.layer.masksToBounds = false
        //nameLabel.layer.shadowOffset = CGSize(width: -0.5, height: 0.5)
         //nameLabel.layer.shadowRadius = 5
        //nameLabel.layer.shadowOpacity = 0.3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
