//
//  PlanCollectionViewCell.swift
//  notefit
//
//  Created by Pierluigi Di paolo on 26/10/22.
//

import UIKit

class PlanCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setShadow()
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = false
        // Initialization code
    }
    
}

