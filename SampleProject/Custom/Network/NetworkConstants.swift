//
//  NetworkConstants.swift
//  SampleProject
//
//  Created by shubham on 10/04/22.
//

import Foundation
import Alamofire

typealias ResponseCallback = (_ result: Any?) -> Void

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case string = "String"
}

enum ContentType: String {
    case json = "Application/json"
    case formEncode = "application/x-www-form-urlencoded"
    case multipart = "multipart/form-data"
}

enum RequestParams {
    case body(_:Parameters)
    case url(_:Parameters)
}

enum ErrorResult: Error {
    case network(string: String)
    case custom(string: String)
}

public enum Result<Value, E: Error> {
    case success(Value)
    case failure(E)
    
    public var isSuccess: Bool {
        switch self {
        case .success:
            return true
        case .failure:
            return false
        }
    }
    
    public var isFailure: Bool {
        return !isSuccess
    }
    
    public var value: Value? {
        switch self {
        case .success(let value):
            return value
        case .failure:
            return nil
        }
    }
}

public enum AppError: Error {
    case appError
    case serverError
    case noData
    case decodingError
    case unknown
    case invalidUrl
    
    func stringMessage() -> String {
        switch self {
        case .appError:
            return "Application Error"
        case .serverError:
            return "Server Error"
        case .noData:
            return "No data"
        case .decodingError:
            return "Decoding Error"
        case .unknown:
            return "Unknown Error"
        case .invalidUrl:
            return "Invalid Url"
        }
    }
}

/* Errors Type */
struct ErrorImagesParameters {
    static let NotificationError        = "NotificationError"
    static let CartError                = "CartError"
    static let EventListEmptyError      = "EventListEmptyError"
    static let PhotoBookListEmptyError  = "PhotoBookListEmptyError"
    static let GalleryListError         = "GalleryListError"
    static let NoDataFoundError         = "NoDataFoundError"
    static let ServerError              = "ServerError"
    static let SearchError              = "SearchError"
    static let WishlistError            = "WishlistError"
    static let NoOrderError             = "NoOrderError"
    static let InternectionError        = "InternectionError"
    static let TimeOutError             = "TimeOutError"
    static let productError             = "productError"
    static let icMessageError           = "icMessageError"
    static let icSaveCardError          = "icSaveCardError"
    static let icCouponError            = "icCouponError"
    static let icWalletError            = "icWalletError"
    static let icAddressError           = "icAddressError"
    static let icGiftError              = "icGiftError"
    static let icReviewError            = "icReviewError"
    static let icPackageListError       = "icPackageListError"
}
