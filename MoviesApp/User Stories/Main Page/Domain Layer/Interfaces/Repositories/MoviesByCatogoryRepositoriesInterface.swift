//
//  MoviesByCatogoryRepositoriesInterface.swift
//  MoviesApp
//
//  Created by Alibek on 16.04.2024.
//

import Foundation

protocol MoviesByCatogoryRepositoriesInterface: AnyObject {
    func getMovies(by category: MoviesCatagory, completion: @escaping (Result<[MoviePosterModel], Error>) -> Void)
    func getMoreMovies(completion: @escaping (Result<[MoviePosterModel], Error>) -> Void)
}
