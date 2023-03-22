//
//  ProfileVCViewModelProtocol.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 15.03.23.
//

import UIKit

protocol ProfileVCViewModelProtocol {
  func prepareModels() -> [ProfileMenu]
  func notification(image: UIImage)
}
