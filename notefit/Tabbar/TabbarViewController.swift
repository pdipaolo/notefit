//
//  TabbarViewController.swift
//  notefit
//
//  Created by Pierluigi Di paolo on 21/10/22.
//

import UIKit

class TabbarViewController: UITabBarController, UITabBarControllerDelegate {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.selectedIndex = 0
        setupMiddleButton()
    }
    
    func setupMiddleButton() {
        let middleButton = UIButton(frame: CGRect(x: (self.view.bounds.width / 2) - 20, y: -27, width: 39, height: 39))
        middleButton.setImage(UIImage(named: "plus"), for: .normal)
        middleButton.backgroundColor = UIColor.black
        middleButton.transform  = CGAffineTransformMakeRotation( CGFloat(Double.pi / 4))
        middleButton.layer.cornerRadius = 5
        middleButton.layer.shadowColor = UIColor.darkGray.cgColor
        middleButton.layer.shadowOpacity = 0.5
        middleButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        middleButton.addTarget(self, action: #selector(menuButtonAction), for: .touchUpInside)
        self.tabBar.addSubview(middleButton)
    }
    
    @objc func menuButtonAction(sender: UIButton) {
        self.selectedIndex = 2
    }

}
