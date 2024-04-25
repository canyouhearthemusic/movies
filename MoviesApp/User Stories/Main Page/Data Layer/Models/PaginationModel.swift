//
//  PogenationModel.swift
//  MoviesApp
//
//  Created by Alibek on 16.04.2024.
//

import Foundation

struct PaginationModel<T: Decodable>: Decodable {
    let page: Int
    let totalPages: Int
    let totalResults: Int
    let results: [T]
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case results
    }
}
