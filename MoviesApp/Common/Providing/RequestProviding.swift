//
//  RequestProviding.swift
//  MoviesApp
//
//  Created by Alibek on 16.04.2024.
//

import Foundation

protocol RequestProviding {
    var shouldAddAuthorizationToken: Bool { get }
    var urlRequest: URLRequest { get }
}
