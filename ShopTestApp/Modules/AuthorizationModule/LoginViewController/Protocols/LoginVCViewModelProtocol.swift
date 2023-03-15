//
//  LoginVCViewModelProtocol.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 15.03.23.
//

import Foundation

protocol LoginVCViewModelProtocol {
  func isNameInKeychain(email: String) -> Bool
  func finish(shouldMovetoParentVC: Bool)
}
