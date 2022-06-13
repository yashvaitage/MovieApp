//
//  NetworkManagerProtocol.swift
//  SampleProject
//
//  Created by shubham on 10/04/22.
//

import Foundation

// MARK: - App Man Service Delegate For Fetch Success or Failure Data
@objc protocol AppMainServiceDelegate: AnyObject {
    func didFetchData(responseData: Any)
    func didFailWithError(error: NSError) 
}
