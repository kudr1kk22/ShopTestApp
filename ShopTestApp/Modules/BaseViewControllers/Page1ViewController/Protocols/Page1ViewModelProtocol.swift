//
//  Page1ViewModelProtocol.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 16.03.23.
//

import Foundation

protocol Page1ViewModelProtocol {
  func prepareModels() -> [CategoryCellModel]
  func fetchData()
  var sections: [SectionType] { get }
  var latestModel: [Latest] { get }
  var complitionHandler: (() -> Void)? { get set }
}
