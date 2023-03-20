//
//  CategoryCellModel.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 16.03.23.
//

import UIKit

enum CategoryCellModel {
  case phones
  case headPhones
  case games
  case cars
  case furniture
  case kids

  var title: String {
    switch self {
    case .phones: return "Phones"
    case .headPhones: return "Headphones"
    case .games: return "Games"
    case .cars: return "Cars"
    case .furniture: return "Furniture"
    case .kids: return "Kids"
    }
  }

  var image: UIImage? {
    switch self {
    case .phones: return UIImage(named: "phones")
    case .headPhones: return UIImage(named: "headphones")
    case .games: return UIImage(named: "games")
    case .cars: return UIImage(named: "cars")
    case .furniture: return UIImage(named: "furniture")
    case .kids: return UIImage(named: "kids")
    }
  }
}
