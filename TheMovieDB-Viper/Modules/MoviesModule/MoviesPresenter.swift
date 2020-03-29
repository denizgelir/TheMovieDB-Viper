//
//  MoviesPresenter.swift
//  CIViperGenerator
//
//  Created by denizgelir on 28.03.2020.
//  Copyright © 2020 denizgelir. All rights reserved.
//

import Foundation

protocol MoviesPresenterInterface: class {
   func viewDidAppear()
   func rowTapped(movieId:Int)
   func getNumberOfRows() -> Int
   func getMovieItems(at index: Int) -> MovieResult
}

class MoviesPresenter {

    unowned var view: MoviesViewControllerInterface
    let router: MoviesRouterInterface?
    let interactor: MoviesInteractorInterface?
    var movieResponse = [MovieResult]()

    init(interactor: MoviesInteractorInterface, router: MoviesRouterInterface, view: MoviesViewControllerInterface) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension MoviesPresenter: MoviesPresenterInterface {
    func viewDidAppear() {
        DispatchQueue.main.async {
            self.interactor?.fetchPopularMovies()
        }
    }
    
    func rowTapped(movieId: Int) {
        router?.navigateToMovieDetail(movieId: movieId)
    }
    
    func getNumberOfRows() -> Int {
        return movieResponse.count
    }
    
    func getMovieItems(at index: Int) -> MovieResult {
        return movieResponse[index]
    }

}

extension MoviesPresenter : MoviesInteractorOutputProtocol{
    func moviesFetchedSuccessfully(movies: MovieList) {
        guard let movies = movies.results else {return}
        self.movieResponse = movies
        view.setupTableView()
        view.reloadTableView()
    }
    
    func moviesFetchingFailed(error: Error) {
        print(error.localizedDescription)
    }
    
    
}
