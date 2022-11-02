//
//  Tabbar.swift
//  notefit
//
//  Created by Pierluigi Di paolo on 21/10/22.
//

import UIKit

class Tabbar: UITabBar {

    private var shapeLayer: CALayer?
    
    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = pathPath()
        shapeLayer.strokeColor = UIColor.clear.cgColor
        shapeLayer.fillColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 1.0
        
        shapeLayer.shadowOffset = CGSize(width: -2, height: -2)
        shapeLayer.shadowRadius = 2
        shapeLayer.shadowColor = UIColor.darkGray.cgColor
        shapeLayer.shadowOpacity = 0.5
        
        if let oldShapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        }else{
            self.layer.insertSublayer(shapeLayer, at: 0)
        }
        self.shapeLayer = shapeLayer
    }
    
    override func draw(_ rect: CGRect) {
        self.addShape()
        self.unselectedItemTintColor = UIColor.gray
        self.tintColor = UIColor.white
    }
    
    func pathPath() -> CGPath{
        let pathPath = UIBezierPath()
        let centerWidth = self.frame.width / 2
        
        pathPath.move(to: CGPoint(x: 0, y: 0))
        pathPath.addLine(to: CGPoint(x: self.frame.width, y: 0))
        
        pathPath.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        pathPath.addLine(to: CGPoint(x: 0, y: self.frame.height))
        pathPath.addLine(to: CGPoint(x: 0, y: 0))
        pathPath.addLine(to: CGPoint(x: centerWidth - 28, y: 0))
        pathPath.addLine(to: CGPoint(x: centerWidth, y: self.frame.height / 3))
        pathPath.addLine(to: CGPoint(x: centerWidth + 28, y: 0))

        pathPath.close()
        
        return pathPath.cgPath
    }
}
