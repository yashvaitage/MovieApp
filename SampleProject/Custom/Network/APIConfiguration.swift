//
//  APIConfiguration.swift
//  SampleProject
//
//  Created by shubham on 10/04/22.
//

import Foundation
import Alamofire

// MARK: - Protocol For API Configuration 
protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: RequestParams { get }
}
