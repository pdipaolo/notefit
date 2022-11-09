//
//  ShowExerciseViewController.swift
//  notefit
//
//  Created by Pierluigi Di paolo on 04/11/22.
//

import UIKit

class ShowExerciseViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var exerciseImageView: UIImageView!
    var exercise: Exercise?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        guard let bodyPart = exercise?.bodyPart, let url = exercise?.gifUrl, let name =  exercise?.name else {return}
        nameLabel.text = name
        typeLabel.text = bodyPart
//        Todo inserire immagine
    }
}
