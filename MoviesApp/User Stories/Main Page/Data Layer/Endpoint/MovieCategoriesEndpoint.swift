//
//  MovieCategoryEndpoint.swift
//  MoviesApp
//
//  Created by Alibek on 16.04.2024.
//

import Foundation

enum MoviesCategoriesEndpoint {
    case getMovies(category: String, page: Int)
}

extension MoviesCategoriesEndpoint: RequestProviding {
    var urlRequest: URLRequest {
        switch self {
        case .getMovies(let category, let page):
            guard let url = URL(string: Constants.apiHost + "/movie/\(category)?language=en-US&page=\(page)") else { fatalError() }
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
            return urlRequest
        }
    }
    
    var shouldAddAuthorizationToken: Bool {
        switch self {
        case .getMovies:
            return true
        }
    }
}
