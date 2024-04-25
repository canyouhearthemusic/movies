//
//  DetailModel.swift
//  MoviesApp
//
//  Created by Alibek on 16.04.2024.
//

import Foundation

struct DetailModel: Decodable {
    let id: Int
    let title: String
    let imageURLPath: String
    let releaseDate: String
    let duration: Int
    var voteAverage: Double?
    var popularity: Double?
    let overview: String
    var productionCompanies: [MovieProductionModel]
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case imageURLPath = "backdrop_path"
        case releaseDate = "release_date"
        case duration = "runtime"
        case voteAverage = "vote_average"
        case popularity
        case overview
        case productionCompanies = "production_companies"
    }
}
