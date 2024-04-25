//
//  MoviesByCategoryDataSource .swift
//  MoviesApp
//
//  Created by Alibek on 16.04.2024.
//

import Foundation

protocol MoviesByCategoryDataSource: AnyObject {
    func getMovies(by category: String, page: Int, completion: @escaping
                   (Result<PaginationModel<MoviePosterModel>, Error>) -> Void)
}

class MoviesByCatagoryRemoteDataSource {
    private let network: Network
    
    init(network: Network) {
        self.network = network
    }
}

extension MoviesByCatagoryRemoteDataSource: MoviesByCategoryDataSource {
    func getMovies(by category: String, page: Int, completion: @escaping (Result<PaginationModel<MoviePosterModel>, Error>) -> Void) {
        network.execute(MoviesCategoriesEndpoint.getMovies(category: category, page: page), completion: completion)
    }
}
