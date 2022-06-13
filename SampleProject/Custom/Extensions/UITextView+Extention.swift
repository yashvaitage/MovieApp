//
//  UITextView+Extention.swift
//  SampleProject
//
//  Created by shubham on 10/04/22.
//

import Foundation
import UIKit

// MARK: UITextView Extension
extension UITextView {
    
    open override func awakeFromNib() {
        // change color based on application theme color
        self.tintColor = ColorCode.blue.colorWithHexString(hex: ColorCode.blue)
    }
    
    // MARK: - Formatting TextView with Simple text with custom font, size and color
    func setCustomText(text: String?, font: String?, size: String?, color: String?, style: String?) {
        if AppModelUtils.sharedInstance.isFlip {
            self.textAlignment = .right
        } else {
            self.textAlignment = .left
        }
        if let text = text { self.text = text }
        if let color = color {
            self.textColor = color.colorWithHexString(hex: color)
        }
        if let size = size, let font = font {
            if let size = size.CGFloatValue() {
                self.font = UIFont.init(name: font, size: size)
            }
        }
    }
}
