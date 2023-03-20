//
//  LatestModelArray.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 16.03.23.
//

import Foundation

struct LatestModelArray: Codable {
    let latest: [Latest]
}

// MARK: - Latest

struct Latest: Codable {
    let category, name: String
    let price: Int
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case category, name, price
        case imageURL = "image_url"
    }
}
