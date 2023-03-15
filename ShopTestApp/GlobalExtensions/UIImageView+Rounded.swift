//
//  UIImageView+Rounded.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 13.03.23.
//

import UIKit

extension UIImageView {

    func makeRounded() {
        layer.borderWidth = 1
        layer.masksToBounds = false
        layer.borderColor = Colors.profileImageBorder.cgColor
        layer.cornerRadius = self.frame.height / 2
        clipsToBounds = true
    }
}
