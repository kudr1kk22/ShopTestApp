//
//  ProfileVCViewModel.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 14.03.23.
//

import Foundation

protocol ProfileVCViewModelProtocol {
  func prepareModels() -> [ProfileMenu]
}

final class ProfileVCViewModel: ProfileVCViewModelProtocol {

    //MARK: - Prepare Models
     func prepareModels() -> [ProfileMenu] {
      let models = [
        ProfileMenu.tradeStore,
        ProfileMenu.paymentMethod,
        ProfileMenu.balance,
        ProfileMenu.tradeHistory,
        ProfileMenu.restorePurchase,
        ProfileMenu.help,
        ProfileMenu.logOut
      ]
      return models
    }

}
