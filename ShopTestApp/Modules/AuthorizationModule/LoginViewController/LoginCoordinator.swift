//
//  LoginCoordinator.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 15.03.23.
//

import UIKit

final class LoginCoordinator: Coordinator {


    private var navigationController: UINavigationController
    private var rootCoordinator: LoginRootCoordinatorProtocol

    var childCoordinators = [Coordinator]()

    init(navigationController: UINavigationController,
         rootCoordinator: LoginRootCoordinatorProtocol) {
        self.navigationController = navigationController
        self.rootCoordinator = rootCoordinator
    }

    func start() {
        let viewController = LoginAssebmler.makeLoginVC(coordinator: self)
        navigationController.pushViewController(viewController, animated: true)
    }

    func finish() {
        rootCoordinator.registerFinished(self)
    }
}

extension LoginCoordinator: LoginCoordinatorProtocol {

    func finish(shouldMovetoParentVC: Bool) {
        if shouldMovetoParentVC {
            navigationController.popViewController(animated: true)
        }
        finish()
    }

}
