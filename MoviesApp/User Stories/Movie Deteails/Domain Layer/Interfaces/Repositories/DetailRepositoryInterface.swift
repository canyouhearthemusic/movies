//
//  DetailRepositoryInterface.swift
//  MoviesApp
//
//  Created by Alibek on 16.04.2024.
//

import Foundation

protocol DetailRepositoryInterface: AnyObject {
    func getMovie(by id: Int, completion: @escaping (Result<DetailModel, Error>) -> Void)
}
