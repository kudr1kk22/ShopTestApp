//
//  Page1Coordinator.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 15.03.23.
//

import UIKit

final class Page1Coordinator: Coordinator {

  private var navigationController: UINavigationController
  private var rootCoordinator: Page1RootCoordinatorProtocol

  var childCoordinators = [Coordinator]()

  init(navigationController: UINavigationController,
       rootCoordinator: Page1RootCoordinatorProtocol) {
    self.navigationController = navigationController
    self.rootCoordinator = rootCoordinator
  }

  func start() {
    
  }

  func finish() {

  }
}
