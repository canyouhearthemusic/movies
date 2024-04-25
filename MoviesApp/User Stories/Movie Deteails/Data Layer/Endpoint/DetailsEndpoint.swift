//
//  DetailsEndpoint.swift
//  MoviesApp
//
//  Created by Alibek on 16.04.2024.
//

import Foundation

enum DetailsEndpoint {
    case getDetails(movieId: Int)
}

extension DetailsEndpoint: RequestProviding {
    var urlRequest: URLRequest {
        switch self {
        case .getDetails(let movieId):
            guard let url = URL(string: Constants.apiHost + "/movie/\(movieId)?language=en-US" ) else { fatalError() }
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
            return urlRequest
        }
    }
    
    var shouldAddAuthorizationToken: Bool {
        switch self {
        case .getDetails:
            return true
        }
    }
}
