//
//  UIStoryboard+Extension.swift
//  SampleProject
//
//  Created by shubham on 10/04/22.
//

import Foundation
import UIKit

extension UINavigationController {
    func popToViewController(ofClass: AnyClass, animated: Bool = true) {
        if let vcObj = viewControllers.last(where: { $0.isKind(of: ofClass) }) {
            popToViewController(vcObj, animated: animated)
        }
    }
}
