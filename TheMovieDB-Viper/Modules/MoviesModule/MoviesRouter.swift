//
//  MoviesRouter.swift
//  CIViperGenerator
//
//  Created by denizgelir on 28.03.2020.
//  Copyright © 2020 denizgelir. All rights reserved.
//

import Foundation
import UIKit

protocol MoviesRouterInterface: class {
    func navigateToMovieDetail(movieId: Int)
}

class MoviesRouter: NSObject {

    weak var presenter: MoviesPresenterInterface?
    private weak var viewController: MoviesViewController?

    static func setupModule() -> MoviesViewController {
        let vc = MoviesViewController()
        let interactor = MoviesInteractor()
        let router = MoviesRouter()
        let presenter = MoviesPresenter(interactor: interactor, router: router, view: vc)
        vc.presenter = presenter
        router.presenter = presenter
        interactor.output = presenter
        router.viewController = vc
        return vc
}
    
}

extension MoviesRouter: MoviesRouterInterface {
    func navigateToMovieDetail(movieId: Int) {
        let vc = MovieDetailRouter.setupModule()
        vc.movieId = movieId
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}

