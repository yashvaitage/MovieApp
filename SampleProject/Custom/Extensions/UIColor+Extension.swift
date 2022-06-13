//
//  UIColor+Extension.swift
//  SampleProject
//
//  Created by shubham on 10/04/22.
//

import Foundation
import UIKit

extension UIColor {
    // MARK: - Converting String value to hex Value 
    public convenience init?(hex: String) {
        let rValue, gValue, bValue, alpha: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                if scanner.scanHexInt64(&hexNumber) {
                    rValue = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    gValue = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    bValue = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    alpha = CGFloat(hexNumber & 0x000000ff) / 255
                    self.init(red: rValue, green: gValue, blue: bValue, alpha: alpha)
                    return
                }
            }
        }
        return nil
    }
}
