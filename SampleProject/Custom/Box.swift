//
//  Box.swift
//  SampleProject
//
//  Created by apple on 15/04/22.
//

import Foundation

class Box<T> {
  
  typealias Listener = (T) -> Void
  var listener: Listener?
  
  var value: T {
    didSet {
      // Notify listener
      listener?(value)
    }
  }
  
  init(_ value: T) {
    self.value = value
  }
  
  func bind(listener: Listener?) {
    self.listener = listener
    listener?(value)
  }
  
}
