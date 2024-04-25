//
//  URL + ext.swift
//  MoviesApp
//
//  Created by Alibek on 16.04.2024.
//

import Foundation

extension URLRequest {
    mutating func addAuthorizationToken() {
        allHTTPHeaderFields = ["Authorization": "Bearer \(Constants.apiToken)"]
    }
}
