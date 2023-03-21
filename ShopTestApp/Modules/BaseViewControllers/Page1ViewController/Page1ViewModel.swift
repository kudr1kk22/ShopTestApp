//
//  Page1ViewModel.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 15.03.23.
//

import Foundation

enum SectionType {
  case category(viewModels: [CategoryCellModel])
  case latest(viewModels: [Latest])
  case flashSale(viewModels: [FlashSale])

  var title: String {
    switch self {
    case .category:
      return ""
    case .latest:
      return "Latest"
    case .flashSale:
      return "Flash sale"
    }
  }

  var viewAll: Bool {
    switch self {
    case .latest: return true
    case .flashSale: return true
    default: return false
    }
  }
}

final class Page1ViewModel: Page1ViewModelProtocol {

  //MARK: - Properties

  var sections = [SectionType]()
  private let networkService: NetworkServiceProtocol
  var latestModel: [Latest] = []
  var complitionHandler: (() -> Void)?
  var flashSaleModel: [FlashSale] = []

//MARK: - Init

  init(networkService: NetworkServiceProtocol) {
    self.networkService = networkService
    fetchData()
  }

  //MARK: - Fetch data

  func fetchData() {
    let group = DispatchGroup()
    group.enter()
    group.enter()

    networkService.getLatest { [weak self] result in
      defer {
          group.leave()
      }
      switch result {
      case .success(let model):
        self?.latestModel = model.latest
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
    networkService.getFlashSales { [weak self] result in
      defer {
        group.leave()
      }
      switch result {
      case .success(let model):
        self?.flashSaleModel = model.flashSale
      case . failure(let error):
        print(error.localizedDescription)
      }
    }

    group.notify(queue: .main) {
      self.configureModels()
      self.complitionHandler?()
      }
    

  }

  //MARK: - Configure Models


  func configureModels() {
    sections.append(.category(viewModels: self.prepareModels()))
    sections.append(.latest(viewModels: latestModel))
    sections.append(.flashSale(viewModels: flashSaleModel))
  }

  //MARK: - Prepare Models
  func prepareModels() -> [CategoryCellModel] {
    let models = [
      CategoryCellModel.phones,
      CategoryCellModel.headPhones,
      CategoryCellModel.games,
      CategoryCellModel.cars,
      CategoryCellModel.furniture,
      CategoryCellModel.kids
    ]
    return models
  }
}
