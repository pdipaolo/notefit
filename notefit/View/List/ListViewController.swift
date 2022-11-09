//
//  ListViewController.swift
//  notefit
//
//  Created by Pierluigi Di paolo on 21/10/22.
//

import UIKit
import Combine

class ListViewController: UIViewController {

    @IBOutlet weak var listTableView: UITableView!
    let listViewModel = ListViewModel()
    var exercisesList: [String: [Exercise]]?
    var listSection: [String]?
    var cancellable: Set<AnyCancellable> = []
    var exercise: Exercise?
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.delegate = self
        listTableView.dataSource = self
        listTableView.register(UINib(nibName: "WorkoutTableViewCell", bundle: nil), forCellReuseIdentifier: "workoutCell")
        Task {
            try await listViewModel.readLocalList()
            listViewModel.$list.sink{ result in
                switch result {
                case .success(let list):
                    let group = Dictionary(grouping: list, by: {$0.target})
                    self.listSection = group.map({$0.key}).sorted(by: {$0 < $1})
                    self.exercisesList = group
                    self.listTableView.reloadData()
                case .failure(let error):
                    print(error)
                default:
                    break;
                }
            }.store(in: &cancellable)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ShowExercise") {
            let viewController = segue.destination as! ShowExerciseViewController
            viewController.exercise = exercise
        }
    }
}

extension ListViewController: UITableViewDelegate {
    
}

extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let exerciseSection = listSection?[section], let list = exercisesList else {
            return 0
        }
        guard let count = list[exerciseSection]?.count else{
            return 0
        }
        return count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let count = listSection?.count else {
            return 0
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  80
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "workoutCell", for: indexPath) as! WorkoutTableViewCell
        cell.layer.cornerRadius = 15
        cell.layer.masksToBounds = false
        
        guard let exerciseSection = listSection?[indexPath.section], let list = exercisesList, let name = list[exerciseSection]?[indexPath.row].name else {
            return cell
        }
        cell.nameLabel.text = name
//        cell.nameLabel.text = name
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 80))
        let title = UILabel(frame: CGRect(x: 10, y: 0, width: self.view.frame.width, height: 40))
        view.backgroundColor = .clear
        view.addSubview(title)
        guard let sectionName = listSection?[section] else {
            return nil
        }
        title.text = sectionName
        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let exerciseSection = listSection?[indexPath.section], let list = exercisesList, let selected = list[exerciseSection]?[indexPath.row] else {
            return
        }
        exercise = selected
        performSegue(withIdentifier: "ShowExercise", sender: nil)
    }
}
