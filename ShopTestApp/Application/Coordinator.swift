//
//  Coordinator.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 15.03.23.
//

import Foundation

protocol Coordinator: AnyObject {

    var childCoordinators: [Coordinator] { get }

    func start()
    func finish()
}
