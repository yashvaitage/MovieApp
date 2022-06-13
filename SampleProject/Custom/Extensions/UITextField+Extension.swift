//
//  UITextField+Extension.swift
//  SampleProject
//
//  Created by shubham on 10/04/22.
//

import Foundation
import UIKit

private var _maxLengths = [UITextField: Int]()

// MARK: - UITextField Extension
extension UITextField {
    
    open override func awakeFromNib() {
        // change color based on application theme color
        self.tintColor = ColorCode.blue.colorWithHexString(hex: ColorCode.blue)
    }
    
    @IBInspectable var maxLength: Int {
        get {
            guard let len = _maxLengths[self] else {
                return 150 // (global default-limit. or just, Int.max)
            }
            return len
        }
        set {
            _maxLengths[self] = newValue
            addTarget(self, action: #selector(fix), for: .editingChanged)
        }
    }
    
    @objc func fix(textField: UITextField) {
        let txt = textField.text
        textField.text = txt?.safelyLimitedTo(length: maxLength)
    }
    
    // MARK: - Formatting TextField PlaceHolder with Simple text with custom font, size and color
    func setCustomizePlaceHolder(text: String?, font: String?, size: String?, color: String?) {
        let placeHolder = NSMutableAttributedString()
        var txtName = ""
        if AppModelUtils.sharedInstance.isFlip {
            self.textAlignment = .right
        } else {
            self.textAlignment = .left
        }
        if let name = text {
            txtName  = name
        }
        // Set the Font
        if let size = size, let font = font {
            if let size = size.CGFloatValue() {
                self.font = UIFont.init(name: font, size: size)
            }
        }
        // Set the color
        if let color = color {
            placeHolder.addAttribute(NSAttributedString.Key.foregroundColor,
                                     value: color.colorWithHexString(hex: color),
                                     range: NSRange(location: 0, length: txtName.count))
        }
        // Add attribute
        self.attributedPlaceholder = placeHolder
    }
    
    // MARK: - Setting image on left side of Textfield with customize imageTint Color*/
    func setLeftImage(imageName: String, imageTintColor: String?) {
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        let image = UIImage(named: imageName)
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        if let color = imageTintColor {
            imageView.tintImageColor(color: color.colorWithHexString(hex: color))
            
        }
        self.leftView = imageView
        self.leftViewMode = .always
        //        self.contentMode = .scaleAspectFit
    }
    
    // MARK: - Setting image on left side of Textfield
    func setLeftOrignalImage(imageName: String) {
        self.leftViewMode = .always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 15))
        //        imageView.contentMode = .scaleAspectFit
        //        imageView.clipsToBounds = true
        let url = URL(string: imageName)
        if let urlValue = url {
            let data = try? Data(contentsOf: urlValue)
            if let imageData = data {
                imageView.image = UIImage(data: imageData)
                self.leftView = imageView
            }
        }
    }
    
    // MARK: - Formatting TextField with Simple text with custom font, size and color
    func setCustomText(text: String?, font: String?, size: String?, color: String?, style: String?) {
        self.textAlignment = .justified
        if AppModelUtils.sharedInstance.isFlip {
            self.textAlignment = .right
            self.makeTextWritingDirectionRightToLeft(true)
        } else {
            self.textAlignment = .left
            self.makeTextWritingDirectionLeftToRight(true)
        }
        if let text = text {
            self.text = text
        }
        if let color = color {
            self.textColor = color.colorWithHexString(hex: color)
        }
        if let size = size,
           let font = font {
            if let size = size.CGFloatValue() {
                self.font = UIFont.init(name: font, size: size)
            }
        }
    }
}
