//
//  UIButton+Extension.swift
//  SampleProject
//
//  Created by shubham on 10/04/22.
//

import Foundation
import UIKit

// swiftlint:disable function_parameter_count
extension UIButton {
    // MARK: - Setting image Tint Color
    func setCustomImageTint(image: UIImage?, color: String?) {
        if let img = image {
            self.setImage(img.withRenderingMode(.alwaysTemplate), for: .normal)
        }
        if let color = color {
            self.tintColor = color.colorWithHexString(hex: color)
        }
    }
    
    func underline() {
                    guard let text = self.titleLabel?.text else { return }
                    let attributedString = NSMutableAttributedString(string: text)
                
                    // NSAttributedStringKey.foregroundColor: UIColor.blue
                
                    attributedString.addAttribute(NSAttributedString.Key.underlineColor,
                                                  value: self.titleColor(for: .normal)!,
                                                  range: NSRange(location: 0,
                                                                 length: text.count))
                    attributedString.addAttribute(NSAttributedString.Key.foregroundColor,
                                                  value: self.titleColor(for: .normal)!,
                                                  range: NSRange(location: 0,
                                                                 length: text.count))
                    attributedString.addAttribute(NSAttributedString.Key.underlineStyle,
                                                  value: NSUnderlineStyle.single.rawValue,
                                                  range: NSRange(location: 0,
                                                                 length: text.count))
                    self.setAttributedTitle(attributedString, for: .normal)
                }
    
    // MARK: - Apply right side corner radious to Button
    func roundedButton() {
        let maskPath1 = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: [.topRight, .bottomRight],
                                     cornerRadii: CGSize(width: 18, height: 18))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
    
    // MARK: - Make Buttin circle
    func makeButtonCircle() {
        self.layer.cornerRadius =  self.bounds.size.width / 2
        self.clipsToBounds = true
    }
    
    // MARK: - Customizing buttin with Corner Radius, Border Widh, BorderColor, and background Color
    func setBorderWithValues(cornerRadius: CGFloat, borderWidth: CGFloat, borderColor: CGColor?, bgColor: String?) {
        
        if let bgColor = bgColor {
            self.backgroundColor = bgColor.colorWithHexString(hex: bgColor)
        }
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
        self.clipsToBounds = true
    }
    
    // MARK: - Formatting Button text with Simple text with custom font, size and color
    func setCustomText(text: String?, font: String?, size: String?, color: String?, style: String?, backgroundColor: String?, cornerRadius: String?) {
        if let text = text {
            self.setTitle(text, for: .normal)
        }
        if let cornerRadius = cornerRadius {
            if let radius = cornerRadius.CGFloatValue() {
                self.layer.cornerRadius = radius
            }
        }
        if let color = color {
            self.setTitleColor(color.colorWithHexString(hex: color), for: .normal)
        }
        if let backgroundColor = backgroundColor {
            self.backgroundColor = backgroundColor.colorWithHexString(hex: backgroundColor)
        }
        if let size = size, let font = font {
            if let size = size.CGFloatValue() {
                self.titleLabel?.font = UIFont.init(name: font, size: size)
            }
        }
    }
}
