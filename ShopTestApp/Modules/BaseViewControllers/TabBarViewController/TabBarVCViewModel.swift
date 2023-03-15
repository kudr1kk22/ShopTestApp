//
//  TabBarVCViewModel.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 15.03.23.
//

import Foundation

final class TabBarVCViewModel {

  //MARK: - Properties

  private weak var coordinator: TabBarCoordinatorProtocol?

  //MARK: - Initialization

  init(coordinator: TabBarCoordinatorProtocol) {
      self.coordinator = coordinator
  }

 

}
