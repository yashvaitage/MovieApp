//
//  TemplateMainService.swift
//  SampleProject
//
//  Created by shubham on 10/04/22.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

// swiftlint:disable cyclomatic_complexity
class TemplateMainService: NSObject, URLSessionDelegate, URLSessionDataDelegate, URLSessionTaskDelegate {
    // MARK: - Properties
    weak var mainServerdelegate: AppMainServiceDelegate?
    var responseType = NSString()
    static let session = Alamofire.Session.default
    
    override init() { }
    
    // ----------------------------------------------
    // MARK: - Get Call Through Alamofire
    // ----------------------------------------------
    func getCallWithAlamofire(serverUrl: String) {
        
        print(serverUrl)
        
        let mainThread = DispatchQueue(label: "com.cnoon.response-queue", qos: .utility, attributes: [.concurrent])
        mainThread.async {
            
            AF.request(serverUrl,
                       method: .get,
                       parameters: nil,
                       encoding: URLEncoding.default,
                       headers: AppModelUtils.sharedInstance.getHeader()).responseJSON {  response in
                
                switch response.result {
                case let .success(value):
                    self.mainServerdelegate?.didFetchData(responseData: value)
                    print("JSON: \(value)") // serialized json response
                    return
                case let .failure(error):
                    print(error.localizedDescription)
                    self.mainServerdelegate?.didFailWithError(error: error as NSError)
                    return
                }
            }
        }
    }
    
    // ----------------------------------------------
    // MARK: - Post call through Alamofire
    // ----------------------------------------------
    func postCallWithAlamofire(serverUrl: String, bodyParameter: NSDictionary ) {
        print(serverUrl)
        print(bodyParameter)
        var params = [String: AnyObject]()
        for (key, value) in bodyParameter {
            if let key = key as? String {
                params[key] = value as AnyObject
            }
        }
        let mainThread = DispatchQueue(label: "com.cnoon.response-queue", qos: .utility, attributes: [.concurrent])
        mainThread.async {
            
            AF.request(serverUrl,
                       method: .post,
                       parameters: params,
                       encoding: JSONEncoding.default,
                       headers: AppModelUtils.sharedInstance.getHeader()).responseJSON {  response in
                
                switch response.result {
                case let .success(value):
                    self.mainServerdelegate?.didFetchData(responseData: value)
                    print("JSON: \(value)") // serialized json response
                    return
                case let .failure(error):
                    print(error.localizedDescription)
                    self.mainServerdelegate?.didFailWithError(error: error as NSError)
                    return
                }
            }
        }
    }
    
    // -------------------------------------------------------
    // MARK: - Post call through Alamofire
    // -------------------------------------------------------
    func restUploadDataWithAlamofire(serverUrl: String, bodyParameter: NSDictionary, imageParameter: Data?, videoParameters: [Data]) {
        print(serverUrl)
        print(bodyParameter)
        print(imageParameter ?? Data())
        var params = [String: AnyObject]()
        
        let localHeaders: HTTPHeaders = [
            "Accept": "application/json",
            "Content-Type": "multipart/form-data",
            "Authorization": AppModelUtils.sharedInstance.getAuthToken()
        ]
        for (key, value) in bodyParameter {
            if let key = key as? String {
                params[key] = value as AnyObject
            }
        }
        
        AF.upload(multipartFormData: { (multipartFormData) in
            for (key, value) in params {
                if let stringValue = value as? String {
                    if let data = stringValue.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue)) {
                        multipartFormData.append(data, withName: key)
                    }
                }
                if let value = value as? [[String: Any]] {
                    if let arrData =  try? JSONSerialization.data(withJSONObject: value, options: .prettyPrinted) {
                        print(String(data: arrData, encoding: .utf8) ?? "")
                        if let data = (String(data: arrData,
                                              encoding: .utf8) ?? "").data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue)) {
                            multipartFormData.append(data, withName: key)
                        }
                    }
                }
                if let value = value as? [String: Any] {
                    if let arrData =  try? JSONSerialization.data(withJSONObject: value, options: .prettyPrinted) {
                        print(String(data: arrData, encoding: .utf8) ?? "")
                        if let data = (String(data: arrData,
                                              encoding: .utf8) ?? "").data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue)) {
                            multipartFormData.append(data, withName: key)
                        }
                    }
                }
            }
            // MARK: uncomment below code if you pass multiple images.
            //            for data in imageParameter {
            //                let date = Date()
            //                let formatter = DateFormatter()
            //                formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
            //                let someDateTime = formatter.string(from: date)
            //                let fileName = someDateTime + "image.jpg"
            //                multipartFormData.append(data, withName: "attachement", fileName: "image.jpeg", mimeType: "image/jpeg")
            //            }
            if let imageData = imageParameter {
                let date = Date()
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
                let someDateTime = formatter.string(from: date)
                let fileName = someDateTime + "image.jpg"
                multipartFormData.append(imageData, withName: "attachement", fileName: fileName, mimeType: "image/jpeg")
            }
            
            for objVideo in videoParameters {
                let date = Date()
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
                let someDateTime = formatter.string(from: date)
                let fileName = someDateTime + "video.mov"
                multipartFormData.append(objVideo, withName: "video[]", fileName: fileName, mimeType: "video/quicktime")
            }
        }, to: serverUrl, usingThreshold: UInt64.init(), method: .post, headers: localHeaders).response { (response) in
            if let error = response.error {
                self.mainServerdelegate?.didFailWithError(error: error as NSError)
                return
            }
            if let response = response.data {
                do {
                    let jsonData = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.mutableContainers)
                    print(jsonData)
                    self.mainServerdelegate?.didFetchData(responseData: jsonData)
                    
                } catch let error as NSError {
                    print(error.localizedDescription)
                    self.mainServerdelegate?.didFailWithError(error: error as NSError)
                }
            }
        }
    }
}
