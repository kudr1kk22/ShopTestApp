//
//  UITextField+RoundedBorder.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 13.03.23.
//

import UIKit

extension UITextField {

  func roundedBorder() {
    self.layer.cornerRadius = 10.0
    self.clipsToBounds = true
  }

}
