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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //if iphone 8 shrink font to 32
        // else 38
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
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        layer.shadowRadius = 1.0
        layer.shadowOpacity = 0.85
        
        //nameLabel.layer.borderWidth = 0.3
        //nameLabel.layer.borderColor = UIColor.red.cgColor
        //nameLabel.layer.cornerRadius = 20.0
        //nameLabel.layer.masksToBounds = true
        //nameLabel.layer.shadowOffset = CGSize(width: -0.5, height: 0.5)
       // nameLabel.layer.shadowRadius = 0.65
        //nameLabel.layer.shadowOpacity = 0.85
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
