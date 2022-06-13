//
//  Enum.swift
//  SampleProject
//
//  Created by shubham on 10/04/22.
//

import Foundation
import UIKit
import ObjectMapper

/* User default Name */
struct UserDefaultPreference {
    static let LANGID                   = "language_id"
    static let optionId                 = "option_id"
    static let cartMasterId             = "cart_master_id"
    static let CUSTOMERID               = "user_id"
    static let currencyId               = "curId"
    static let PRODUCTID                = "product_id"
    static let Language                 = "LANGUAGE"
    static let Launch                   = "LAUNCH"
    static let LANGUAGEID               = "LANGUAGEID"
    static let CURRENCYID               = "CURRENCYID"
    static let REMEMBERME               = "REMEMBERME"
    static let LATITUDE                 = "LATITUDE"
    static let LANGUAGEDATA             = "LANGUAGEDATA"
    static let UIFLIP                   = "UIFLIP"
    static let DEVICEID                 = "deviceId"
    static let CLEARHISTORY             = "CLEARHISTORY"
    static let EMAIL                    = "EMAIL"
    static let MASTERID                 = "MASTERID"
    static let ISFORCEUPDATE            = "ISFORCEUPDATE"
    static let websiteId                = "websiteId"
    static let storeId                  = "storeId"
    static let groupId                  = "groupId"
    static let code                     = "code"
    static let Login                    = "Login"
    static let USERNAME                 = "USERNAME"
    static let ISSKIP                   = "ISSKIP"
    static let LANGUAGENAME             = "LANGUAGENAME"
}

/* Payment Component */
struct PaymentComponent {
    static let walletBalance     = "walletBalance"
    static let existingCardsList = "existingCardsList"
    static let applePay          = "applePay"
    static let netBanking        = "netBanking"
    static let payOnDelivery     = "payOnDelivery"
    static let payOnline         = "payOnline"
    static let giftCard          = "giftCard"
    static let sendAsGift        = "sendAsGift"
    static let addNewCards       = "addNewCards"
}

/* Servlet Name Parameters */
struct ServletNameParameters {
    static let language              = "api/v1/getAllLanguages"
    static let getLabelList          = "api/v1/get-labels"
    static let login                 = "api/v1/signin"
    static let signUp                = "api/v1/signup"
    static let shareURL              = "ShareURL"
    static let home                  = "api/v1/home-page-component"
}

/* Drop Down Type */
struct DropDownType {
    static let addDeleteList: [String] = ["Add", "Delete"]
    static let addressTypeList: [String] = ["Home", "Office"]
    static let editDeleteList: [String] = ["Edit", "Delete"]
    static let expiryMonthList: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
    static let raddomColorArr: [String] = ["#FFE0DA", "#FFFEDA", "#F0FFDA", "#DAFDFF", "#DAE9FF", "#DEDAFF"]
}

/* Storyboards Ids */
struct StoryboardsIds {
    static let HomeScreen = "HomeViewController"
    static let NextScreen = "NextViewController"
}

/* Main Strings */
struct ResourceType {
    static let defaultParameters             = "defaultParameters"
    static let customerID                    = "customerId"
    static let productImage                  = "productImage"
    static let AppProductFeature             = "AppProductFeature"
    static let AppDataService                = "AppDataService"
    static let AppProductStyle               = "AppProductStyle"
}

/* Component Names */
struct ComponentsName {
    static let ProductList                   = "productList"
    static let PriceDetails                  = "priceDetails"
    static let ProductListComponent          = "componentProductList"
    static let listElements                  = "listElements"
    static let topBarElements                = "topBarElements"
    static let packages                      = "packages"
    static let banner                        = "banner"
}

/* Account Type */
struct AccountType {
    static let Web    = "WEB"
    static let Native = "NATIVE"
    static let popup  = "POPUP"
}

/* Identifier List */
struct IdentifierList {
    static let SignInView                = "SignInView"
    static let LanguageVc                = "LanguageVc"
}
/* Policy Type */
struct PolicyType {
    static let Web      = "WEB"
    static let Native   = "NATIVE"
}

struct AuthenticationType {
    static let Normal    = ""
    static let Google    = "google"
    static let Facebook  = "facebook"
    static let Apple     = "apple"
}

struct NavigationType {
    static let Terms        = "term"
    static let Privacy      = "Privacy"
    static let Verification = "verification"
}

struct CommanParameters {
    static let customerID          = "customerId"
    static let userId              = "user_id"
    static let langId              = "language_id"
    static let currencyId          = "curId"
    static let deviceType          = "deviceType"
    static let authorization       = "Authorization"
    static let deviceOSType        = "ios"
    static let socialAuthorization = "socialAuthorization"
}

struct DeviceRegisterParameters {
    static let deviceId      = "deviceId"
    static let deviceType    = "deviceType"
    static let deviceIP      = "ip_address"
    static let deviceOSType  = "deviceOSType"
    static let customerId    = "customerId"
    static let firebaseToken = "firebaseToken"
}

/* Push Notification Type */
enum PushNotificationType: String {
    case productDetails         =   "productDetails"
    case localNotification      = "localNotifications"
    case localImageNotification = "localImageNotification"
}

class CustomSuccessModel: Mappable {
    var code: Int?
    var statusCode: AnyObject?
    var message: String?
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        code <- map["statusCode"]
        statusCode <- map["statusCode"]
        message <- map["message"]
    }
}
