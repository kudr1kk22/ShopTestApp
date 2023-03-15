//
//  AppCoordinator.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 15.03.23.
//

import UIKit

final class AppCoordinator: Coordinator {

    private var window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    private lazy var rootNavigationController: UINavigationController = {
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        return navigationController
    }()

    var childCoordinators = [Coordinator]()

    func start() {
        openLoginScene()
        window.makeKeyAndVisible()
    }

    func finish() {

    }


    private func openLoginScene() {
        let coordinator = SignInCoordinator(rootNavigationController: rootNavigationController, rootCoordinator: self)

        childCoordinators.append(coordinator)
        coordinator.start()
    }

}

extension AppCoordinator: SignInRootCoordinatorProtocol {

    func loginFinished(_ coordinator: Coordinator) {
        childCoordinators.removeAll(where: { $0 === coordinator })
        start()
    }
}
