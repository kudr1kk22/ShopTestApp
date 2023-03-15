//
//  TabBarAssebmler.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 15.03.23.
//

import UIKit

final class TabBarAssembler {

  private init() { }

  //MARK: - Profile ViewController

  static func makeProfileViewController() -> UIViewController {
      let viewModel = makeProfileViewModel()
      let viewController = ProfileViewController(viewModel: viewModel)
      return viewController
  }

  private static func makeProfileViewModel() -> ProfileVCViewModelProtocol {
      let viewModel = ProfileVCViewModel()
      return viewModel
  }

  //MARK: - Page1 ViewController

  static func makePage1ViewController() -> UIViewController {
      let viewModel = makePage1ViewModel()
      let viewController = Page1ViewController(viewModel: viewModel)
      return viewController
  }

  private static func makePage1ViewModel() -> Page1ViewModelProtocol {
      let viewModel = Page1ViewModel()
      return viewModel
  }

}
