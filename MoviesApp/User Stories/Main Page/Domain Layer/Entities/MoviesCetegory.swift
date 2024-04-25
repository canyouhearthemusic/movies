//
//  MoviesCetegory.swift
//  MoviesApp
//
//  Created by Alibek on 16.04.2024.
//

import Foundation

enum MoviesCatagory: String, CaseIterable {
    case nowPlaying = "now_playing"
    case popular
    case topRated = "top_rated"
    case upcoming
    
    var title: String {
        switch self {
        case .nowPlaying:
            return "Now Playing"
        case .popular:
            return "Popular"
        case .topRated:
            return "Top Rated"
        case .upcoming:
            return "Upcoming"
        }
    }
}
