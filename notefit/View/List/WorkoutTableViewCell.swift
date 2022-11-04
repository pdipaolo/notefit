//
//  workoutTableViewCell.swift
//  notefit
//
//  Created by Pierluigi Di paolo on 04/11/22.
//

import UIKit

class WorkoutTableViewCell: UITableViewCell {

    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        containerView.layer.cornerRadius = 15
        containerView.layer.masksToBounds = true
        // Configure the view for the selected state
    }
    
}
