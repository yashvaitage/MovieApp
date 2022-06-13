//
//  UIApplication+Extension.swift
//  SampleProject
//
//  Created by shubham on 10/04/22.
//

import Foundation
import UIKit

extension UIApplication {
    @available(iOS 13.0, *)
    var currentWindow: UIWindow? {
        connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
    }
}
