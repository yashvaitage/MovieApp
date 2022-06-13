//
//  UIView+Extension.swift
//  SampleProject
//
//  Created by shubham on 10/04/22.
//

import Foundation
import UIKit

extension UIView {
    // MARK: - Set Specific Round Corners To View
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    // MARK: - Set Round Corners To View
    func setCornerRadius(size: CGFloat) {
        self.layer.cornerRadius = size
        self.clipsToBounds = true
    }
    
    // MARK: - Add Simple Shadow To View
    func addShadowSimple() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = ("BFBFBF".colorWithHexString(hex: "BFBFBF")).cgColor
        self.layer.shadowOpacity = 0.6
        self.layer.shadowOffset = .init(width: 0, height: 0)
        self.layer.shadowRadius = 3.0
    }
    
    // MARK: - Applying Shadow to View ith corner radius
    func addShadow(shadowColor: UIColor, cornerRadius: String?, backGroundColor: String?) {
        if let bgColor = backGroundColor {
            self.backgroundColor = bgColor.colorWithHexString(hex: bgColor)
        }
        if let cornerRadius = cornerRadius?.CGFloatValue() {
            self.layer.cornerRadius = cornerRadius
        }
        self.layer.masksToBounds = false
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = 0.6
        self.layer.shadowOffset = .init(width: 1, height: 1)
        self.layer.shadowRadius = 3.0
    }
    
    // MARK: - Applying Shadow to View ith corner radius
    func addCustomBorder(cornerRadius: String?, backGroundColor: String?, borderWidth: String?, borderColor: String?) {
        if let bgColor = backGroundColor {
            self.backgroundColor = bgColor.colorWithHexString(hex: bgColor)
        }
        if let cornerRadius = cornerRadius?.CGFloatValue() {
            self.layer.cornerRadius = cornerRadius
        }
        if let borderWidth = borderWidth?.CGFloatValue() {
            self.layer.borderWidth = borderWidth
        }
        if let color = borderColor {
            self.layer.borderColor = color.colorWithHexString(hex: color).cgColor
        }
        //        self.layer.masksToBounds = false
    }
    
    // MARK: - Creating view to circle
    func makeCircle() {
        self.layer.cornerRadius =  self.bounds.size.width / 2
        self.clipsToBounds = true
    }
}

@IBDesignable class DottedVertical: UIView {
    
    @IBInspectable var dotColor: UIColor = UIColor.red
    @IBInspectable var lowerHalfOnly: Bool = false
    
    override func draw(_ rect: CGRect) {
        
        // say you want 8 dots, with perfect fenceposting:
        let totalCount = 8 + 8 - 1
        let fullHeight = bounds.size.height
        let width = bounds.size.width
        let itemLength = fullHeight / CGFloat(totalCount)
        
        let path = UIBezierPath()
        
        let beginFromTop = CGFloat(0.0)
        let top = CGPoint(x: width/2, y: beginFromTop)
        let bottom = CGPoint(x: width/2, y: fullHeight)
        
        path.move(to: top)
        path.addLine(to: bottom)
        
        path.lineWidth = width
        
        let dashes: [CGFloat] = [itemLength, itemLength]
        path.setLineDash(dashes, count: dashes.count, phase: 0)
        
        // for ROUNDED dots, simply change to....
        // let dashes: [CGFloat] = [0.0, itemLength * 2.0]
        // path.lineCapStyle = CGLineCap.round
        
        dotColor.setStroke()
        path.stroke()
    }
}
