//
//  SignInVCViewModel.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 13.03.23.
//

import Foundation
import Security

final class SignInVCViewModel: SignInVCViewModelProtocol {

  //MARK: - Properties

  private weak var coordinator: SignInCoordinatorProtocol?

  //MARK: - Initialization

  init(coordinator: SignInCoordinatorProtocol) {
      self.coordinator = coordinator
  }

  //MARK: - Scenes

  func openLoginScene() {
      coordinator?.openLoginScene()
  }

  //MARK: - Email validation

  func isValidEmail(email: String) -> Bool {

      let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
      let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)

      return emailPredicate.evaluate(with: email)
  }

  func saveNameToKeychain(email: String) -> Bool {
      guard let data = email.data(using: .utf8) else { return false }
      let query: [String: Any] = [
          kSecClass as String: kSecClassGenericPassword,
          kSecAttrAccount as String: email,
          kSecValueData as String: data
      ]
      let status = SecItemAdd(query as CFDictionary, nil)
      return status == errSecSuccess
  }
}
