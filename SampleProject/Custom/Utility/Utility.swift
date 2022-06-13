//
//  Utility.swift
//  SampleProject
//
//  Created by shubham on 10/04/22.
//

import Foundation
import UIKit

class Utility: NSObject {
    
    // MARK: - Singletone Property
    static let sharedInstance: Utility = {
        let instance = Utility()
        return instance
    }()
    
    private override init() { }
    
    // MARK: - Convert Any type to String value
    func getStringValue(value: Any?) -> String {
        if let value = value {
            if let stringValue = value as? String {
                return stringValue
            } else {
                if let numberValue = value as? NSNumber {
                    return numberValue.stringValue
                } else {
                    if let intValue = value as? Int {
                        return "\(intValue)"
                    } else {
                        return ""
                    }
                }
            }
        } else {
            return ""
        }
    }
    
    // MARK: - Convert Any type to Number value
    func getNumberValue(value: Any?) -> NSNumber {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        if let _:Any = value {
            
            if let strNumber = value as? String {
                return formatter.number(from: strNumber) ?? 0
            } else if let num = (value as? NSNumber)?.stringValue {
                return formatter.number(from: num) ?? 0
            } else { return 0 }
        } else { return 0 }
    }
    
    // MARK: - Get Current View Controller
    func getCurrentViewController() -> UIViewController? {
        if #available(iOS 13.0, *) {
            if let window = UIApplication.shared.currentWindow {
                if let tabBarController =  window.rootViewController as? UITabBarController {
                    return  tabBarController.selectedViewController
                } else  if let navController =  window.rootViewController as? UINavigationController {
                    return  navController.visibleViewController
                } else {
                    return nil
                }
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
    
    func setConstraintWithTopPadding(subView: UIView, RelateviveToSecondView superView: UIView) {
        subView.translatesAutoresizingMaskIntoConstraints = false
        let constX: NSLayoutConstraint = NSLayoutConstraint(item: subView,
                                                            attribute: NSLayoutConstraint.Attribute.centerX,
                                                            relatedBy: NSLayoutConstraint.Relation.equal,
                                                            toItem: superView,
                                                            attribute: NSLayoutConstraint.Attribute.centerX,
                                                            multiplier: 1,
                                                            constant: 0)
        superView.addConstraint(constX)
        let constY: NSLayoutConstraint = NSLayoutConstraint(item: subView,
                                                           attribute: NSLayoutConstraint.Attribute.centerY,
                                                           relatedBy: NSLayoutConstraint.Relation.equal,
                                                           toItem: superView,
                                                           attribute: NSLayoutConstraint.Attribute.centerY,
                                                           multiplier: 1,
                                                           constant: ((UIScreen.main.bounds.height * 0.11) + 2))
        superView.addConstraint(constY)
        let constW: NSLayoutConstraint = NSLayoutConstraint(item: subView,
                                                           attribute: NSLayoutConstraint.Attribute.width,
                                                           relatedBy: NSLayoutConstraint.Relation.equal,
                                                           toItem: superView,
                                                           attribute: NSLayoutConstraint.Attribute.width,
                                                           multiplier: 1,
                                                           constant: 0)
        superView.addConstraint(constW)
        let constH: NSLayoutConstraint = NSLayoutConstraint(item: subView,
                                                           attribute: NSLayoutConstraint.Attribute.height,
                                                           relatedBy: NSLayoutConstraint.Relation.equal,
                                                           toItem: superView,
                                                           attribute: NSLayoutConstraint.Attribute.height,
                                                           multiplier: 1,
                                                           constant: 0)
        superView.addConstraint(constH)
    }
    
    func setConstraintWithTopMorePadding(subView: UIView, RelateviveToSecondView superView: UIView) {
        subView.translatesAutoresizingMaskIntoConstraints = false
        let constX: NSLayoutConstraint = NSLayoutConstraint(item: subView,
                                                           attribute: NSLayoutConstraint.Attribute.centerX,
                                                           relatedBy: NSLayoutConstraint.Relation.equal,
                                                           toItem: superView,
                                                           attribute: NSLayoutConstraint.Attribute.centerX,
                                                           multiplier: 1,
                                                           constant: 0)
        superView.addConstraint(constX)
        let constY: NSLayoutConstraint = NSLayoutConstraint(item: subView,
                                                           attribute: NSLayoutConstraint.Attribute.centerY,
                                                           relatedBy: NSLayoutConstraint.Relation.equal,
                                                           toItem: superView,
                                                           attribute: NSLayoutConstraint.Attribute.centerY,
                                                           multiplier: 1,
                                                           constant: ((UIScreen.main.bounds.height * 0.11) + 60))
        superView.addConstraint(constY)
        let constW: NSLayoutConstraint = NSLayoutConstraint(item: subView,
                                                           attribute: NSLayoutConstraint.Attribute.width,
                                                           relatedBy: NSLayoutConstraint.Relation.equal,
                                                           toItem: superView,
                                                           attribute: NSLayoutConstraint.Attribute.width,
                                                           multiplier: 1,
                                                           constant: 0)
        superView.addConstraint(constW)
        let constH: NSLayoutConstraint = NSLayoutConstraint(item: subView,
                                                           attribute: NSLayoutConstraint.Attribute.height,
                                                           relatedBy: NSLayoutConstraint.Relation.equal,
                                                           toItem: superView,
                                                           attribute: NSLayoutConstraint.Attribute.height,
                                                           multiplier: 1,
                                                           constant: 0)
        superView.addConstraint(constH)
    }
    
    func setConstraintWithSearchTopMorePadding(subView: UIView, RelateviveToSecondView superView: UIView) {
        subView.translatesAutoresizingMaskIntoConstraints = false
        let constX: NSLayoutConstraint = NSLayoutConstraint(item: subView,
                                                           attribute: NSLayoutConstraint.Attribute.centerX,
                                                           relatedBy: NSLayoutConstraint.Relation.equal,
                                                           toItem: superView,
                                                           attribute: NSLayoutConstraint.Attribute.centerX,
                                                           multiplier: 1,
                                                           constant: 0)
        superView.addConstraint(constX)
        let constY: NSLayoutConstraint = NSLayoutConstraint(item: subView,
                                                           attribute: NSLayoutConstraint.Attribute.centerY,
                                                           relatedBy: NSLayoutConstraint.Relation.equal,
                                                           toItem: superView,
                                                           attribute: NSLayoutConstraint.Attribute.centerY,
                                                           multiplier: 1,
                                                           constant: (UIScreen.main.bounds.height * 0.12))
        superView.addConstraint(constY)
        let constW: NSLayoutConstraint = NSLayoutConstraint(item: subView,
                                                           attribute: NSLayoutConstraint.Attribute.width,
                                                           relatedBy: NSLayoutConstraint.Relation.equal,
                                                           toItem: superView,
                                                           attribute: NSLayoutConstraint.Attribute.width,
                                                           multiplier: 1,
                                                           constant: 0)
        superView.addConstraint(constW)
        let constH: NSLayoutConstraint = NSLayoutConstraint(item: subView,
                                                           attribute: NSLayoutConstraint.Attribute.height,
                                                           relatedBy: NSLayoutConstraint.Relation.equal,
                                                           toItem: superView,
                                                           attribute: NSLayoutConstraint.Attribute.height,
                                                           multiplier: 1,
                                                           constant: 0)
        superView.addConstraint(constH)
    }
    
    func setConstraint(subView: UIView, RelateviveToSecondView superView: UIView) {
        subView.translatesAutoresizingMaskIntoConstraints = false
        let constX: NSLayoutConstraint = NSLayoutConstraint(item: subView,
                                                           attribute: NSLayoutConstraint.Attribute.centerX,
                                                           relatedBy: NSLayoutConstraint.Relation.equal,
                                                           toItem: superView,
                                                           attribute: NSLayoutConstraint.Attribute.centerX,
                                                           multiplier: 1,
                                                           constant: 0)
        superView.addConstraint(constX)
        let constY: NSLayoutConstraint = NSLayoutConstraint(item: subView,
                                                           attribute: NSLayoutConstraint.Attribute.centerY,
                                                           relatedBy: NSLayoutConstraint.Relation.equal,
                                                           toItem: superView,
                                                           attribute: NSLayoutConstraint.Attribute.centerY,
                                                           multiplier: 1,
                                                           constant: 0)
        superView.addConstraint(constY)
        let constW: NSLayoutConstraint = NSLayoutConstraint(item: subView,
                                                           attribute: NSLayoutConstraint.Attribute.width,
                                                           relatedBy: NSLayoutConstraint.Relation.equal,
                                                           toItem: superView,
                                                           attribute: NSLayoutConstraint.Attribute.width,
                                                           multiplier: 1,
                                                           constant: 0)
        superView.addConstraint(constW)
        let constH: NSLayoutConstraint = NSLayoutConstraint(item: subView,
                                                           attribute: NSLayoutConstraint.Attribute.height,
                                                           relatedBy: NSLayoutConstraint.Relation.equal,
                                                           toItem: superView,
                                                           attribute: NSLayoutConstraint.Attribute.height,
                                                           multiplier: 1,
                                                           constant: 0)
        superView.addConstraint(constH)
    }
    
    func setConstraintsWithTopPadding(subView: UIView, RelateviveToSecondView superView: UIView) {
        subView.translatesAutoresizingMaskIntoConstraints = false
        let constX: NSLayoutConstraint = NSLayoutConstraint(item: subView,
                                                            attribute: NSLayoutConstraint.Attribute.centerX,
                                                            relatedBy: NSLayoutConstraint.Relation.equal,
                                                            toItem: superView,
                                                            attribute: NSLayoutConstraint.Attribute.centerX,
                                                            multiplier: 1,
                                                            constant: 0)
        superView.addConstraint(constX)
        let constY: NSLayoutConstraint = NSLayoutConstraint(item: subView,
                                                            attribute: NSLayoutConstraint.Attribute.centerY,
                                                            relatedBy: NSLayoutConstraint.Relation.equal,
                                                            toItem: superView,
                                                            attribute: NSLayoutConstraint.Attribute.centerY,
                                                            multiplier: 1,
                                                            constant: UIScreen.main.bounds.height * 0.011)
        superView.addConstraint(constY)
        let constW: NSLayoutConstraint = NSLayoutConstraint(item: subView,
                                                            attribute: NSLayoutConstraint.Attribute.width,
                                                            relatedBy: NSLayoutConstraint.Relation.equal,
                                                            toItem: superView,
                                                            attribute: NSLayoutConstraint.Attribute.width,
                                                            multiplier: 1,
                                                            constant: 0)
        superView.addConstraint(constW)
        let constH: NSLayoutConstraint = NSLayoutConstraint(item: subView,
                                                            attribute: NSLayoutConstraint.Attribute.height,
                                                            relatedBy: NSLayoutConstraint.Relation.equal,
                                                            toItem: superView,
                                                            attribute: NSLayoutConstraint.Attribute.height,
                                                            multiplier: 1,
                                                            constant: 0)
        superView.addConstraint(constH)
    }
    
    /* Getting JSON from Data */
    func getJsonFromData(data: Data?) ->(responseDate: Any?, error: Error?) {
        if let data = data {
            do {
                let jsonData = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
                return (jsonData, nil)
            } catch let error as NSError {
                print(error.localizedDescription)
                return (nil, error)
            }
        } else { return (nil, nil) }
    }
    
}
