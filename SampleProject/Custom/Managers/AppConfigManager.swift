//
//  AppConfigManager.swift
//  SampleProject
//
//  Created by shubham on 10/04/22.
//

import Foundation
import UIKit

class AppConfigManager: NSObject {
    var productStyle: NSDictionary?
    var productFeatures: NSDictionary?
    var dataService: NSDictionary?
    var baseURL: String?
    var mainBaseURL: String?
    var fontSize: String?
    var isGoogle        = false
    var isFacebook      = false
    var latitude        = ""
    var longitude       = ""
    var noDataFound     = ""
    var title           = ""
    var message         = ""
    var firebaseToken   = ""
    var isShowBanner    = false
    var isApiCall       = false
    var isOrderCreated  = false
    var userDevice      = ""
    var agreementUrl    = ""
    var textColor       = ColorCode.blue
    var paymentPublicKey = ""
    var isNetworkAvailable: Bool   = true
    var isAfterLoginFromLoginScreen = false
    
    // MARK: - Creating Share object
    static let sharedInstance: AppConfigManager = {
        let instance = AppConfigManager()
        return instance
    }()
    
    // MARK: - Applying Theme Color
    var appColor: UIColor {
        get {
            if AppConfigManager.sharedInstance.productStyle?["THEM_COLOR"] as? String != nil {
                guard let textColor = AppConfigManager.sharedInstance.productStyle?["THEM_COLOR"] as? String else { return UIColor.white }
                return textColor.colorWithHexString(hex: textColor)
            } else { return UIColor.white }
        }
        set { _ = newValue }
    }
    
    // MARK: - Validating Email
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    // MARK: - Validating Password
    func isValidPassword(password: String) -> Bool {
        let passwordRegEx = "^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: password)
    }
    
    // MARK: - Validating First Name and Last
    func isValidName(name: String) -> Bool {
        let nameRegEx = name.count
        if nameRegEx <= 25 { return true } else { return false }
    }
    
    // MARK: - Validating Mobile Number
    func isValidMobile(mobileNo: String) -> Bool {
        let mobileRegEx = mobileNo.count
        if mobileRegEx > 7 && mobileRegEx < 11 { return true } else { return false }
    }
    
    // MARK: - Validiting and Getting API resopnse from pList or from API
    private override init() {
        
        if let path =  Bundle.main.path(forResource: ResourceType.AppProductFeature, ofType: BundleType.plist) {
            productFeatures = NSDictionary(contentsOfFile: path)!
        }
        if let path =  Bundle.main.path(forResource: ResourceType.AppDataService, ofType: BundleType.plist) {
            dataService = NSDictionary(contentsOfFile: path)!
        }
        if let path =  Bundle.main.path(forResource: ResourceType.AppProductStyle, ofType: BundleType.plist) {
            productStyle = NSDictionary(contentsOfFile: path)!
        }
    }
}
