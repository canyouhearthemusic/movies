//
//  SearchEndpoint.swift
//  MoviesApp
//
//  Created by Alibek on 16.04.2024.
//

import Foundation

enum SearchMoviesEndpoint {
    case getMovies(query: String, page: Int)
}

extension SearchMoviesEndpoint: RequestProviding {
    var shouldAddAuthorizationToken: Bool {
          true
    }
    
    var urlRequest: URLRequest {
        switch self {
        case .getMovies(let query, let page):
            guard let url = URL(string: Constants.apiHost + "/search/movie") else { fatalError() }
            var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
            var queryItems: [URLQueryItem] = []
            queryItems.append(URLQueryItem(name: "query", value: query))
            queryItems.append(URLQueryItem(name: "page", value: "\(page)"))
            queryItems.append(URLQueryItem(name: "language", value: "en-US"))
            queryItems.append(URLQueryItem(name: "include_adult", value: "false"))
            components?.queryItems = queryItems
            guard let componentsURL = components?.url else { fatalError() }

            let urlRequest = URLRequest(url: componentsURL)
            return urlRequest
        }
    }
    
  
}


