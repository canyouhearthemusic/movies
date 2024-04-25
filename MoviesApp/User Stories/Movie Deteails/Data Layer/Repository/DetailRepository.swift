//
//  DetailRepository.swift
//  MoviesApp
//
//  Created by Alibek on 16.04.2024.
//

import Foundation

class DetailRepository {
    private let dataSource: DetailsDataSource
    
    init(dataSource: DetailsDataSource) {
        self.dataSource = dataSource
    }
}

extension DetailRepository: DetailRepositoryInterface {
    func getMovie(by id: Int, completion: @escaping (Result<DetailModel, Error>) -> Void) {
        dataSource.getMovieDeatils(by: id, completion: completion)
    }
    
}
 
