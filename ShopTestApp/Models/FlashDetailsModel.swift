//
//  FlashDetailsModel.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 20.03.23.
//

import Foundation

struct FlashDetailsModel: Codable {
    let name, description: String
    let rating: Double
    let numberOfReviews, price: Int
    let colors: [String]
    let imageUrls: [String]

    enum CodingKeys: String, CodingKey {
        case name, description, rating
        case numberOfReviews = "number_of_reviews"
        case price, colors
        case imageUrls = "image_urls"
    }
}
