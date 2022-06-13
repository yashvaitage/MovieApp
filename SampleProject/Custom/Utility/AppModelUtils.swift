//
//  AppModelUtils.swift
//  SampleProject
//
//  Created by shubham on 10/04/22.
//

import Foundation
import UIKit
import MobileCoreServices
import AVFoundation
import ObjectMapper
import SwiftKeychainWrapper
import Alamofire
import SDWebImage

// swiftlint:disable inclusive_language

class AppModelUtils: NSObject {
    
    static let sharedInstance: AppModelUtils = {
        let instance = AppModelUtils()
        return instance
    }()
    
    private override init() { }
    
    // -------------------------------------
    // MARK: - Development Server
    // -------------------------------------
//    let baseUrl = ""
    
    // -------------------------------------
    // MARK: - Live Server
    // -------------------------------------
    let baseUrl = ""
    
    var appUnderMaintainenceFlag = ""
    var updateFlagiOS = "0"
    var pageLoadUrl = ""
    var productDetailImageUrl: String?
    var productTitle: String?
    var productDetailImageHeights: CGFloat = 250.0
    var isFromAccount: Bool = false
    let mainService = TemplateMainService()
    
    let imageCache = NSCache<AnyObject, AnyObject>()
    var dictSection = [0: 0]
    
    var isMultiLanguage: String?
    var defaultLanguageId: String?
    var defaultCurrencyId: String?
    let customerId = ""
    var categoryId: Int?
    var brandId = ""
    var searchProductName = ""
    var currentLatitute = ""
    var currentLongitute = ""
    var isComeFromNotification = false
    var isMyAccountUpdate = false
    var isHomeUpdate = false
    var isCategoryUpdate = false
    var isCartUpdate = false
    var noticationQuery = ""
    var notificationType = ""
    var customerIdEnable = ""
    var messageId = ""
    var latestCartCount = ""
    var isGuest = false // true means user come from MY cart screen for new registration
    
    var isFlip: Bool {
        get {
            if !(UserDefaults.standard.value(forKey: UserDefaultPreference.UIFLIP) == nil) {
                if let uiFlip = UserDefaults.standard.string(forKey: UserDefaultPreference.UIFLIP ) {
                    if uiFlip == "1" {
                        return true
                        
                    } else { return false }
                } else { return false }
            } else { return false }
        }
        
        set { _ = newValue }
    }
    
    var isSkip: Bool {
        get {
            if !(UserDefaults.standard.value(forKey: UserDefaultPreference.ISSKIP)==nil) {
                if let ISSKIP = UserDefaults.standard.string(forKey: UserDefaultPreference.ISSKIP ) {
                    if ISSKIP == "1" {
                        return true
                    } else { return false }
                } else { return false }
            } else { return false }
        }
        
        set { _ = newValue }
    }
    
    /* Convert Any type to String value */
    func getAppUrl() -> String {
        var appUrlString = ""
        if let appUrl =  AppConfigManager.sharedInstance.productFeatures?["APP_URL"] as? String {
            appUrlString = appUrl
        }
        return appUrlString
    }
    
    /* Create request header */
    func getHeader() -> HTTPHeaders {
        var header = HTTPHeaders()
        header["Accept"] = "application/json"
        header["Content-Type"] = "application/json"
        header["Authorization"] = self.getAuthToken()
        return header
    }
    
    func getAuthToken() -> String {
        if !(UserDefaults.standard.value(forKey: CommanParameters.authorization)==nil) {
            if let authToken = UserDefaults.standard.string(forKey: CommanParameters.authorization ) {
                if authToken.isEmpty {
                    return ""
                } else {
                    return authToken
                }
            } else { return "" }
        } else { return "" }
    }
    
    /* Getting language Id */
    func getSelectLanguage() -> String {
        if !(UserDefaults.standard.value(forKey: UserDefaultPreference.LANGUAGEID)==nil) {
            if let langId = UserDefaults.standard.string(forKey: UserDefaultPreference.LANGUAGEID ) {
                return langId
            } else { return "" }
        } else { return "" }
    }
    
    /* Getting Cart Master Id */
    func getMasterId() -> String {
        if !(UserDefaults.standard.value(forKey: UserDefaultPreference.MASTERID) == nil) {
            if let masterId = UserDefaults.standard.string(forKey: UserDefaultPreference.MASTERID ) {
                if masterId.isEmpty {
                    return ""
                } else {
                    return masterId
                }
            } else { return "" }
        } else { return "" }
    }
    
    func getWebsiteId() -> String {
        if !(UserDefaults.standard.value(forKey: UserDefaultPreference.websiteId)==nil) {
            if let websiteId = UserDefaults.standard.string(forKey: UserDefaultPreference.websiteId ) {
                if websiteId.isEmpty {
                    return ""
                } else { return websiteId }
            } else { return "" }
        } else { return "" }
    }
    
    func getGroupId() -> String {
        if !(UserDefaults.standard.value(forKey: UserDefaultPreference.groupId)==nil) {
            if let groupId = UserDefaults.standard.string(forKey: UserDefaultPreference.groupId ) {
                if groupId.isEmpty {
                    return ""
                } else { return groupId }
            } else { return "" }
        } else { return "" }
    }
    
    func getStoreId() -> String {
        if !(UserDefaults.standard.value(forKey: UserDefaultPreference.storeId)==nil) {
            if let storeId = UserDefaults.standard.string(forKey: UserDefaultPreference.storeId ) {
                if storeId.isEmpty {
                    return ""
                } else { return storeId }
            } else { return "" }
        } else { return "" }
    }
    
    func getCode() -> String {
        if !(UserDefaults.standard.value(forKey: UserDefaultPreference.code)==nil) {
            if let code = UserDefaults.standard.string(forKey: UserDefaultPreference.code ) {
                if code.isEmpty {
                    return ""
                    
                } else { return code }
            } else { return "" }
        } else { return "" }
    }
    
    func getLanguageName() -> String {
        if !(UserDefaults.standard.value(forKey: UserDefaultPreference.LANGUAGENAME)==nil) {
            if let languageName = UserDefaults.standard.string(forKey: UserDefaultPreference.LANGUAGENAME ) {
                if languageName.isEmpty {
                    return ""
                } else { return languageName }
            } else { return "" }
        } else { return "" }
    }
    
    /* Getting Customer ID take token */
    func getCustomerId() -> String {
        if !(UserDefaults.standard.value(forKey: ResourceType.customerID)==nil) {
            if let customerId = UserDefaults.standard.string(forKey: ResourceType.customerID ) {
                if customerId.isEmpty {
                    return ""
                } else {
                    return customerId
                }
            } else { return "" }
        } else { return "" }
        
    }
    
    /* Getting User Name take token */
    func getUserName() -> String {
        if !(UserDefaults.standard.value(forKey: UserDefaultPreference.USERNAME)==nil) {
            if let userName = UserDefaults.standard.string(forKey: UserDefaultPreference.USERNAME) {
                if userName.isEmpty {
                    return ""
                } else { return userName }
            } else { return "" }
        } else { return "" }
        
    }
    /* Getting Customer ID take token */
    func getEmail() -> String {
        if !(UserDefaults.standard.value(forKey: UserDefaultPreference.EMAIL)==nil) {
            if let email = UserDefaults.standard.string(forKey: UserDefaultPreference.EMAIL) {
                if email.isEmpty {
                    return ""
                } else { return email }
            } else { return "" }
        } else { return "" }
    }
    
    func checkLandingPageCondition(completion: @escaping ((Bool, Bool, Bool) -> Void)) {
        var isLanguage: Bool = false
        var isLogin: Bool = false
        var isBoth: Bool = false
        // check LANDING PAGE condition
        if !(UserDefaults.standard.value(forKey: UserDefaultPreference.Language)==nil) {
            if (UserDefaults.standard.value(forKey: UserDefaultPreference.Language) as? Bool)! {
                isLanguage = true
            }
        }
        if !(UserDefaults.standard.value(forKey: UserDefaultPreference.Login)==nil) {
            if (UserDefaults.standard.value(forKey: UserDefaultPreference.Login) as? Bool)! {
                isLogin = true
            }
        }
        if isLanguage && isLogin {
            isBoth = true
        }
        completion(isBoth, isLanguage, isLogin)
    }
    
    /* Get Document Directory Path */
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    public func getDocumentPath(forItemName name: String) -> URL? {
        return self.getDocumentsDirectory().appendingPathComponent(name)
    }
    
    public func directoryExists(atPath filePath: String) -> Bool {
        var isDir = ObjCBool(true)
        return FileManager.default.fileExists(atPath: filePath, isDirectory: &isDir )
    }
        
    /* Get Aspect Ratio */
    func getImageAspectRatio(width: String, heights: String) -> CGFloat {
        if let width = width.CGFloatValue() {
            if let height = heights.CGFloatValue() {
                return  CGFloat(((UIScreen.main.bounds.width * height) / (width)))
            } else {
                return 180.0
            }
        } else {
            return 180.0
        }
    }
    
    /* Set Aspect Ratio */
    func setAspectRatio(image: UIImage, type: String) {
        if type == ResourceType.productImage {
            productDetailImageHeights =   CGFloat(((UIScreen.main.bounds.width * image.size.height) / (image.size.width)))
        } else if type == ResourceType.productImage {
            
        }
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
  
    /* Generating temparory Product ID */
    func getRandomTempProductId() -> String {
        let date = Date()
        let dateFormater = DateFormatter()
        dateFormater.timeZone = TimeZone(abbreviation: "UTC")
        dateFormater.dateFormat = "mmssSS"
        return ( "I" + dateFormater.string(from: date))
    }
    
}
