//
//  ProfileVCViewModel.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 14.03.23.
//

import UIKit

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

  func notification(image: UIImage) {
    let notificationCenter = NotificationCenter.default
    let image = image
    let userInfo = ["image": image]
    notificationCenter.post(name: Notification.Name("ImageNotification"), object: nil, userInfo: userInfo)
  }
}
