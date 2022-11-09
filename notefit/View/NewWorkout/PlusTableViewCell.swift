//
//  PlusTableViewCell.swift
//  notefit
//
//  Created by Pierluigi Di paolo on 08/11/22.
//

import UIKit

class PlusTableViewCell: UITableViewCell {

    @IBOutlet weak var plusImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        plusImage.layer.cornerRadius = plusImage.layer.frame.height / 2
        plusImage.layer.masksToBounds = false
        // Configure the view for the selected state
    }
    
}
