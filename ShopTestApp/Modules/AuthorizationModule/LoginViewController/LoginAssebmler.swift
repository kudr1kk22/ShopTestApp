//
//  LoginAssebmler.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 15.03.23.
//

import UIKit

final class LoginAssebmler {

    private init() { }

    static func makeLoginVC(coordinator: LoginCoordinatorProtocol) -> UIViewController {
        let viewModel = makeViewModel(coordinator)
        let viewController = LoginViewController(viewModel: viewModel)
        return viewController
    }

    private static func makeViewModel(_ coordinator: LoginCoordinatorProtocol) -> LoginVCViewModelProtocol {
        let viewModel = LoginVCViewModel()
        return viewModel
    }
}
