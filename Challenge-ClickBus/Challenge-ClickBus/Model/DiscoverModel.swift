//
//  DiscoverModel.swift
//  Challenge-ClickBus
//
//  Created by Madeinweb on 23/01/22.
//

import Foundation

// MARK: - DiscoverModel
struct DiscoverModel: Codable {
    let page: Int?
    let results: [DiscoverMovie]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

