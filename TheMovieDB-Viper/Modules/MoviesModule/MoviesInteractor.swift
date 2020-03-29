//
//  MoviesInteractor.swift
//  CIViperGenerator
//
//  Created by denizgelir on 28.03.2020.
//  Copyright © 2020 denizgelir. All rights reserved.
//

import Foundation

protocol MoviesInteractorInterface: class {
   func fetchPopularMovies()
}

protocol MoviesInteractorOutputProtocol : class {
    func moviesFetchedSuccessfully(movies: MovieList)
    func moviesFetchingFailed(error: Error)
}

final class MoviesInteractor {
    weak var output: MoviesInteractorOutputProtocol?
}

extension MoviesInteractor: MoviesInteractorInterface {
    func fetchPopularMovies() {
        RequestManager.shared.getPopularMovies { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let movies):
                self.output?.moviesFetchedSuccessfully(movies: movies)
            case .failure(let error):
                self.output?.moviesFetchingFailed(error: error)
            }
        }
    }
}
