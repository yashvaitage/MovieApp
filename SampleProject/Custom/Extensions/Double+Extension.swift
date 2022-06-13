//
//  Double+Extension.swift
//  SampleProject
//
//  Created by shubham on 10/04/22.
//

import Foundation
import UIKit

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
