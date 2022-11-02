//
//  InfoCollectionViewCell.swift
//  notefit
//
//  Created by Pierluigi Di paolo on 26/10/22.
//

import UIKit

class InfoCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setShadow()
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = false
    }

}
