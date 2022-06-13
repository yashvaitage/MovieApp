//
//  UILabel+Extension.swift
//  SampleProject
//
//  Created by shubham on 10/04/22.
//

import Foundation
import UIKit

// swiftlint:disable legacy_constructor
extension UILabel {
    // MARK: - Formatting labels with attribute text with custom font, size and color
    func setCustomMiddleLineAttributeText(text: String?, font: String?, size: String?, color: String?, scratchLineWidth: String?) {
        let style = NSMutableParagraphStyle()
        if AppModelUtils.sharedInstance.isFlip {
            style.alignment = NSTextAlignment.right
            style.alignment = NSTextAlignment.center // remove if required
        } else {
            style.alignment = NSTextAlignment.left
            style.alignment = NSTextAlignment.center // remove if required
        }
        var attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "")
        if let text = text { attributeString =  NSMutableAttributedString(string: text) }
        if let scratchLineWidth = scratchLineWidth {
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle,
                                         value: Int(scratchLineWidth) ?? 1,
                                         range: NSMakeRange(0, attributeString.length))
        }
        if let color = color {
            attributeString.addAttribute(NSAttributedString.Key.foregroundColor,
                                         value: color.colorWithHexString(hex: color),
                                         range: NSRange(location: 0, length: attributeString.length))
        }
        if let size = size, let font = font {
            if let size = size.CGFloatValue() {
                self.font = UIFont.init(name: font, size: size)
            }
        }
        attributeString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange(location: 0, length: attributeString.length))
        self.attributedText = attributeString
    }
    
    // MARK: - Setting background color in labels
    func setBackgroundColor(backgroundColor: String?) {
        if let backgroundColor = backgroundColor {
            self.backgroundColor = backgroundColor.colorWithHexString(hex: backgroundColor)
        }
    }
    
    // MARK: - Adding shadow to labels
    func addShadow(shadowColor: UIColor) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = 0.6
        self.layer.shadowOffset = .init(width: 1, height: 1)
        self.layer.shadowRadius = 3.0
    }
    
    // MARK: - Formatting labels with Simple text with custom font, size and color
    func setCustomText(text: String?, font: String?, size: String?, color: String?, style: String?) {
        var attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "")
        if let text = text { attributeString =  NSMutableAttributedString(string: text) }
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle,
                                     value: 0,
                                     range: NSMakeRange(0, attributeString.length))
        
        self.attributedText = attributeString
        
        if let color = color {
            self.textColor = color.colorWithHexString(hex: color)
        }
        
        if let size = size, let font = font {
            if let size = size.CGFloatValue() {
                self.font = UIFont.init(name: font, size: size)
            }
        }
    }
    
    // MARK: - Creating Dot line
    func dotBorder() {
        let border = CAShapeLayer()
        border.strokeColor = UIColor.black.cgColor
        border.lineDashPattern = [2, 2]
        border.frame = self.bounds
        border.fillColor = nil
        border.path = UIBezierPath(rect: self.bounds).cgPath
        self.layer.addSublayer(border)
    }
}
