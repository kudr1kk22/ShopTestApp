//
//  SignInVCViewModelProtocol.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 15.03.23.
//

import Foundation

protocol SignInVCViewModelProtocol {
  func isValidEmail(email: String) -> Bool
  func saveNameToKeychain(email: String) -> Bool
  func openLoginScene()
}
