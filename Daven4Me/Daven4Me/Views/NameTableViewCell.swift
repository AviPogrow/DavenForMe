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
        
        
        let customFont = UIFont(name: "SBLHebrew", size: 34)
               
               
        nameLabel.font = customFont
        nameLabel.textAlignment = .right
        nameLabel.semanticContentAttribute = .forceRightToLeft
        nameLabel.adjustsFontSizeToFitWidth = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
