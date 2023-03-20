//
//  FlashSaleModel.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 18.03.23.
//

import Foundation

struct FlashSaleModel: Codable {
  let flashSale: [FlashSale]

  enum CodingKeys: String, CodingKey {
        case flashSale = "flash_sale"
    }

}

// MARK: - FlashSale

struct FlashSale: Codable {
    let category: String
    let name: String
    let price: Double
    let discount: Int
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case category, name, price, discount
        case imageURL = "image_url"
    }
}
