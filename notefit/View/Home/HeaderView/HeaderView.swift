//
//  HeaderView.swift
//  notefit
//
//  Created by Pierluigi Di paolo on 26/10/22.
//

import UIKit
import Combine

class HeaderView: UIView {
    let kCONTENT_XIB_NAME = "HeaderView"
    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var notificationImage: UIImageView!
    @IBOutlet var contentView: HeaderView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    let headerViewModel = HeaderViewModel()
    var cancellable: Set<AnyCancellable> = []
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(kCONTENT_XIB_NAME, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        profile.setShadow()
        profile.setCorner()
        notificationImage.setShadow()
        notificationImage.setCorner()
        setData()
    }
    
    func setData (){
        let today = Date.now
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, d MMMM y"
        dateLabel.text = formatter.string(from: today).capitalized
        Task {
            try await headerViewModel.fetch()
            headerViewModel.$result.sink{result in
                switch result {
                case .success(let value):
                    self.nameLabel.text = "Ciao \(value)";
                case .failure(let error):
                    print(error);
                default:
                    break;
                }
            }.store(in: &cancellable)
        }
    }
    
}

extension UIView {
    func setShadow(){
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowRadius = 2
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
    }
    
    func setCorner() {
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.masksToBounds = false
    }
}
