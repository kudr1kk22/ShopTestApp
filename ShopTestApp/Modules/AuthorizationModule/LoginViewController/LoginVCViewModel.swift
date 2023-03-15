//
//  LoginVCViewModel.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 14.03.23.
//

import Foundation

final class LoginVCViewModel: LoginVCViewModelProtocol {

  private weak var coordinator: LoginCoordinatorProtocol?

  func isNameInKeychain(email: String) -> Bool {
      let query: [String: Any] = [
          kSecClass as String: kSecClassGenericPassword,
          kSecAttrAccount as String: email,
          kSecMatchLimit as String: kSecMatchLimitOne,
          kSecReturnAttributes as String: true
      ]

      var item: CFTypeRef?
      let status = SecItemCopyMatching(query as CFDictionary, &item)

      return status == errSecSuccess
  }

  func finish(shouldMovetoParentVC: Bool) {
      coordinator?.finish(shouldMovetoParentVC: shouldMovetoParentVC)
  }

}
