//
//  SignInCoordinator.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 15.03.23.
//

import UIKit

final class SignInCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []

    private var rootNavigationController: UINavigationController
    private var rootCoordinator: SignInRootCoordinatorProtocol

    init(rootNavigationController: UINavigationController,
         rootCoordinator: SignInRootCoordinatorProtocol) {
        self.rootNavigationController = rootNavigationController
        self.rootCoordinator = rootCoordinator
    }

  func start() {
      let rootViewController = SignInAssembler.makeSignInVC(coordinator: self)
      rootNavigationController.pushViewController(rootViewController, animated: false)
  }

    func finish() {
        rootNavigationController.popViewController(animated: false)
        rootCoordinator.loginFinished(self)
    }

}

extension SignInCoordinator: SignInCoordinatorProtocol {

    func openLoginScene() {
        let logInCoordinator = LoginCoordinator(navigationController: rootNavigationController, rootCoordinator: self)
        childCoordinators.append(logInCoordinator)
      logInCoordinator.start()
    }

}


extension SignInCoordinator: LoginRootCoordinatorProtocol {

    func registerFinished(_ coordinator: Coordinator) {
        childCoordinators.removeAll(where: { $0 === coordinator })
    }
}


