//
//  SignInAssembler.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 15.03.23.
//

import UIKit

final class SignInAssembler {

    private init() { }

    static func makeSignInVC(coordinator: SignInCoordinatorProtocol) -> UIViewController {
        let viewModel = makeViewModel(coordinator: coordinator)
        let viewController = SignInViewController(viewModel: viewModel)
        return viewController
    }

    //MARK: - Helper

    private static func makeViewModel(coordinator: SignInCoordinatorProtocol) -> SignInVCViewModel {
      return SignInVCViewModel(coordinator: coordinator)
    }

}
