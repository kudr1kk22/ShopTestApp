//
//  Page2ViewModel.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 20.03.23.
//

import Foundation

enum SectionsType {
  case fullImage(viewModels: [String])
  case smallImages(viewModels: [String])
  case detailsCell(viewModels: FlashDetailsModel)
  case colorsCell(viewModels: FlashDetailsModel)
}

final class Page2ViewModel: Page2ViewModelProtocol {

  var flashDetailsModel: FlashDetailsModel?
  private let networkService: NetworkServiceProtocol
  var sections = [SectionsType]()
  var complitionHandler: (() -> Void)?

  init(networkService: NetworkServiceProtocol) {
    self.networkService = networkService
    getDetailsInfo()
  }

  func getDetailsInfo() {
    networkService.getDetailsInfo { [weak self] result in
      switch result {
      case .success(let model):
        self?.flashDetailsModel = model
        self?.configureModels()
        self?.complitionHandler?()
      case . failure(let error):
        print(error.localizedDescription)
      }
    }
  }

  func configureModels() {
    guard let model = self.flashDetailsModel else { return }
    sections.append(.fullImage(viewModels: model.imageUrls))
    sections.append(.smallImages(viewModels: model.imageUrls))
    sections.append(.detailsCell(viewModels: model))
    sections.append(.colorsCell(viewModels: model))
  }
  
}
