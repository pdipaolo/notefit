//
//  NewWorkoutViewController.swift
//  notefit
//
//  Created by Pierluigi Di paolo on 21/10/22.
//

import UIKit

class NewWorkoutViewController: UIViewController {

    @IBOutlet weak var newWorkoutTableView: UITableView!
    @IBOutlet weak var endButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    
    var list: [NewExercise]?
    var selectedExercise: NewExercise?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newWorkoutTableView.delegate = self
        newWorkoutTableView.dataSource = self
        newWorkoutTableView.register(UINib(nibName: "PlusTableViewCell", bundle: nil), forCellReuseIdentifier: "PlusCell")
        newWorkoutTableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemCell")

    }

}

extension NewWorkoutViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return 1
        } else {
            guard let list = list else {
                return 0
            }
            return list.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PlusCell", for: indexPath )
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath )
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            performSegue(withIdentifier: "NewExerciseSegue", sender: nil)
        }else {
            selectedExercise = list?[indexPath.row]
            performSegue(withIdentifier: "NewExerciseSegue", sender: nil)
        }
    }
    
    
}
