//
//  Page2ViewModelProtocol.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 20.03.23.
//

import Foundation

protocol Page2ViewModelProtocol {
  var flashDetailsModel: FlashDetailsModel? { get }
  var sections: [SectionsType] { get }
  var complitionHandler: (() -> Void)? { get set }
}
