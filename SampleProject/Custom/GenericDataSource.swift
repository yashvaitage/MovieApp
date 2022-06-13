//
//  GenericDataSource.swift
//  SampleProject
//
//  Created by apple on 15/04/22.
//

import Foundation

class GenericDataSource<T>: NSObject {
  var data: Box<[T]> = Box([]) // Array of Data
}
