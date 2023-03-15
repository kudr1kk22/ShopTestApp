//
//  TabBarVCCoordinator.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 14.03.23.
//

import UIKit

final class TabBarVCCoordinator: Coordinator {

  private var rootNavigationController: UINavigationController
  private var rootCoordinator: TabBarRootCoordinatorProtocol

  var childCoordinators = [Coordinator]()

  init(rootNavigationController: UINavigationController,
       rootCoordinator: TabBarRootCoordinatorProtocol) {
      self.rootNavigationController = rootNavigationController
      self.rootCoordinator = rootCoordinator
  }

  func start() {

  }

  func finish() {
      rootCoordinator.registerFinished(self)
  }
}

extension TabBarVCCoordinator: TabBarCoordinatorProtocol {



}

