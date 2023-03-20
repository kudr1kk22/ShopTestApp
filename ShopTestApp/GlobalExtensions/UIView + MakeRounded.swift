//
//  UIView + MakeRounded.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 17.03.23.
//

import UIKit

extension UIView {

  func simpleMakeRounded(radius: Double) {
      layer.cornerRadius = radius
      clipsToBounds = true
    }
}
