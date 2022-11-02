//
//  HomeViewController.swift
//  notefit
//
//  Created by Pierluigi Di paolo on 21/10/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var infoCollectionView: UICollectionView!
    @IBOutlet weak var planCollectionView: UICollectionView!
    let reuseIdentifier = ["PlanCell", "InfoCell"]
    override func viewDidLoad() {
        super.viewDidLoad()
        planCollectionView.delegate = self
        planCollectionView.dataSource = self
        infoCollectionView.delegate = self
        infoCollectionView.dataSource = self
        planCollectionView.register(UINib(nibName: "PlanCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PlanCell")
        infoCollectionView.register(UINib(nibName: "InfoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "InfoCell")

    }

}

extension HomeViewController: UICollectionViewDelegate {
    
}

extension HomeViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
            case self.planCollectionView:
                return 10
            case self.infoCollectionView:
                return 3
            default:
                return 2
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
            case self.planCollectionView:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier[0], for: indexPath)
                return cell
            case self.infoCollectionView:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier[1], for: indexPath)
                return cell
            default:
                return UICollectionViewCell()
        }

    }
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
            case self.planCollectionView:
                return CGSize(width: 100, height: 140)
            case self.infoCollectionView:
                return CGSize(width: 180, height: 140)
            default:
                return CGSize(width: 0, height: 0)
        }

    }
}

