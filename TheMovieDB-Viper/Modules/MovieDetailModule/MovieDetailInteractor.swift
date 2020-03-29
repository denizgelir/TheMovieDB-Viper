//
//  MovieDetailInteractor.swift
//  CIViperGenerator
//
//  Created by denizgelir on 29.03.2020.
//  Copyright © 2020 denizgelir. All rights reserved.
//

import Foundation

protocol MovieDetailInteractorInterface: class {
    func fetchMovieDetail(movieId:Int)
}

protocol MovieDetailInteractorOutputProtocol: class {
    func movieDetailFetchedSuccessfully(movieDetail:MovieDetail)
    func movieDetailFetchingFailed(withError error: Error)
}

class MovieDetailInteractor {
    weak var output: MovieDetailInteractorOutputProtocol?
}

extension MovieDetailInteractor: MovieDetailInteractorInterface {
    func fetchMovieDetail(movieId: Int) {
        RequestManager.shared.getMovieDetail(movieId: movieId) { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let movieDetail):
                self.output?.movieDetailFetchedSuccessfully(movieDetail: movieDetail)
            case .failure(let error):
                self.output?.movieDetailFetchingFailed(withError: error)
            }
        }
    }
}
