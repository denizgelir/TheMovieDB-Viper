//
//  MovieDetailPresenter.swift
//  CIViperGenerator
//
//  Created by denizgelir on 29.03.2020.
//  Copyright © 2020 denizgelir. All rights reserved.
//

import Foundation

protocol MovieDetailPresenterInterface: class {
    func viewDidAppear()
    func getMovieDetail(movieId: Int)
}

class MovieDetailPresenter {

    unowned var view: MovieDetailViewControllerInterface
    let router: MovieDetailRouter?
    let interactor: MovieDetailInteractorInterface?

    init(interactor: MovieDetailInteractorInterface, router: MovieDetailRouter, view: MovieDetailViewControllerInterface) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension MovieDetailPresenter: MovieDetailPresenterInterface {
    
    func getMovieDetail(movieId: Int) {
        DispatchQueue.main.async {
            self.interactor?.fetchMovieDetail(movieId: movieId)
        }
    }
    
    func viewDidAppear() {
        
    }
    
}

extension MovieDetailPresenter: MovieDetailInteractorOutputProtocol {
    func movieDetailFetchedSuccessfully(movieDetail: MovieDetail) {
        view.showMovieDetail(movie: movieDetail)
    }
    
    func movieDetailFetchingFailed(withError error: Error) {
        print(error)
    }
    
    
}
