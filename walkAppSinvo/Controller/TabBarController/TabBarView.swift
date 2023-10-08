//
//  TabBarView.swift
//  walkAppSinvo
//
//  Created by Rajeev on 04/09/23.
//

import Foundation
import UIKit

class TabBarView: UITabBar {

    private var shapeLayer:CAShapeLayer?
    var centeredWidh:CGFloat = 0
    
    override func draw(_ rect: CGRect) {
        centeredWidh = self.bounds.width / 2
        self.unselectedItemTintColor = UIColor.black
       // self.selectedImageTintColor = UIColor.red
        self.tintColor = .blue
        self.addShape()
    }
    private func addShape()
    {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = getPath()
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 3
        shapeLayer.shadowOffset = CGSize(width: 0, height: 0)
        shapeLayer.shadowOpacity = 0.2
        
        if let oldShape = self.shapeLayer {
            self.layer.replaceSublayer(oldShape, with: shapeLayer)
            
        }
        else
        {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }
        self.shapeLayer = shapeLayer
    }
    
    private func getPath() -> CGPath
    {
        let height:CGFloat = 47
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: centeredWidh - height * 2 , y: 0))
        
        path.addCurve(to: CGPoint(x: centeredWidh, y: height),
                      controlPoint1: CGPoint(x: centeredWidh - 30 , y: 0),//30
                      controlPoint2: CGPoint(x: centeredWidh - 35, y: height))//35
        
        path.addCurve(to: CGPoint(x: centeredWidh + height * 2, y: 0),
                      controlPoint1: CGPoint(x: centeredWidh + 35 , y: height),
                      controlPoint2: CGPoint(x: centeredWidh + 30, y: 0))
        
        
        path.addLine(to: CGPoint(x: self.bounds.width, y: 0))
        path.addLine(to: CGPoint(x: self.bounds.width, y: self.bounds.height))
        path.addLine(to: CGPoint(x: 0, y: self.bounds.height))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.close()
        return path.cgPath
    }
    func updateCurveForTappedIndex()
    {
        guard let selectedTabView = self.selectedItem?.value(forKey: "view") as?
                UIView else{return}
        self.centeredWidh = selectedTabView.frame.origin.x + (selectedTabView.frame.width / 2)
        addShape()
    }
    
    
    
}
