//
//  MoviePosterModel.swift
//  MoviesApp
//
//  Created by Alibek on 16.04.2024.
//

import Foundation

struct MoviePosterModel: Decodable {
    let posterPath: String
    let id: Int
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case title = "original_title"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        let shortPosterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
        self.posterPath = Constants.imageHost + (shortPosterPath ?? "")
        self.title = try container.decode(String.self, forKey: .title)
    }
}
