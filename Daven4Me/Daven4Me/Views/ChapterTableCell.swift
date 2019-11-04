//
//  ChapterTableCell.swift
//  Daven4Me
//
//  Created by user on 6/23/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

class ChapterTableCell: UITableViewCell {

    @IBOutlet weak var chapterLabel: UILabel!
    
    @IBOutlet weak var firstVerseLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let _ = UIFont(name: "SBLHebrew", size: 34)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
