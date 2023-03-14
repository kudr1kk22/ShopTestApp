//
//  TabBarVCConfigurator.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 14.03.23.
//

import UIKit

final class TabBarVCConfigurator {


  static func makeProfileViewController() -> UIViewController {
    let viewModel = ProfileVCViewModel()
    let viewController = ProfileViewController(viewModel: viewModel)
    return viewController
  }
}
