//
//  TehillimTextCollectionView.swift
//  Daven4Me
//
//  Created by user on 12/3/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

class TehillimTextCollectionView: UICollectionView {

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
      super.traitCollectionDidChange(previousTraitCollection)
        print("trait collection invoked")
    }
}
