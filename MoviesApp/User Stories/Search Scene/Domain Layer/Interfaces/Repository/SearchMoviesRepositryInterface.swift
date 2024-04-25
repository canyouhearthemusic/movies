//
//  SearchMoviesRepositryInterface.swift
//  MoviesApp
//
//  Created by Alibek on 16.04.2024.
//

import Foundation

protocol SearchMoviesRepositryInterface: AnyObject {
    func getMovies(query: String, completion: @escaping (Result<[MoviePosterModel], Error>) -> Void)
    func getMoreMovies(completion: @escaping (Result<[MoviePosterModel], Error>) -> Void)
}
