//
//  UIImage+Circle.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 14.03.23.
//

import UIKit

extension UIImage {
  static func circle(diameter: CGFloat, color: UIColor) -> UIImage {
    let size = CGSize(width: diameter, height: diameter)
    let rect = CGRect(origin: CGPoint.zero, size: size)

    UIGraphicsBeginImageContextWithOptions(size, false, 0)
    let context = UIGraphicsGetCurrentContext()!

    context.setFillColor(color.cgColor)
    context.fillEllipse(in: rect)

    let image = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext()
    
    return image
  }
}
