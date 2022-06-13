//
//  String+Extension.swift
//  SampleProject
//
//  Created by shubham on 10/04/22.
//

import Foundation
import UIKit

extension String {
    
    // MARK: - Method For Set Limit To String
    func safelyLimitedTo(length len: Int) -> String {
        if self.count <= len {
            return self
        }
        return String( Array(self).prefix(upTo: len) )
    }
    
    // MARK: - Converting HTML String into Attributed String
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data,
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    
    // MARK: - Converting HTML String into Simple String
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
    
    // MARK: - Converting String into Hex Code
    func colorWithHexString (hex: String) -> UIColor {
        var cString: String = hex.trimmingCharacters(in: NSCharacterSet.whitespaces).uppercased()
        if cString.hasPrefix("#") {
            cString = String(cString.dropFirst())
        }
        if cString.count != 6 {
            return UIColor.gray
        }
        let rString = String(cString[cString.index(cString.startIndex, offsetBy: 0)..<cString.index(cString.endIndex, offsetBy: -4)])
        let gString = String(cString[cString.index(cString.startIndex, offsetBy: 2)..<cString.index(cString.endIndex, offsetBy: -2)])
        let bString = String(cString[cString.index(cString.startIndex, offsetBy: 4)..<cString.index(cString.endIndex, offsetBy: -0)])
        var rValue: CUnsignedInt = 0, gValue: CUnsignedInt = 0, bValue: CUnsignedInt = 0
        Scanner(string: rString).scanHexInt32(&rValue)
        Scanner(string: gString).scanHexInt32(&gValue)
        Scanner(string: bString).scanHexInt32(&bValue)
        return UIColor(red: CGFloat(Float(rValue) / 255.0),
                       green: CGFloat(Float(gValue) / 255.0),
                       blue: CGFloat(Float(bValue) / 255.0),
                       alpha: CGFloat(Float(1)))
    }
    
    // MARK: - Converting into Float Value
    func CGFloatValue() -> CGFloat? {
        guard let doubleValue = Double(self) else {
            return nil
        }
        return CGFloat(doubleValue)
    }
    
    // MARK: - Converting Integer value
    func getnumberValue() -> NSNumber? {
        if !(self.isEmpty) {
            let numberFormatter = NumberFormatter()
            numberFormatter.formatterBehavior = NumberFormatter.defaultFormatterBehavior()
            numberFormatter.numberStyle = NumberFormatter.Style.decimal
            let number  = numberFormatter.number(from: self)
            return number
        }
        return nil
    }
    
    // MARK: - Converting first letter into Capital
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
    
    // MARK: - Mutating Method For Converting first letter into Capital
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    // MARK: - Method For Check Validate Name
    func validateName() -> Bool {
        let nameRegEx = "[a-z A-Z]+"
        let nameTest = NSPredicate(format: "SELF MATCHES %@", nameRegEx)
        return nameTest.evaluate(with: self)
    }
    
    /// Get String Height
    /// - Parameters:
    ///   - font: pass string UIFont
    ///   - width: pass string width
    /// - Returns: function will return height of type CGFloat
    func stringHeight(font: UIFont, width: CGFloat) -> CGFloat {
        let attrString = NSAttributedString(string: self, attributes: [NSAttributedString.Key.font: font])
        let bounds = attrString.boundingRect(with: CGSize(width: width, height: .greatestFiniteMagnitude),
                                             options: .usesLineFragmentOrigin,
                                             context: nil)
        return bounds.height
    }
}
