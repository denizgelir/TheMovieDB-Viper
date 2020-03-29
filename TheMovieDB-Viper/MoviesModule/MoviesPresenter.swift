//
//  MoviesPresenter.swift
//  CIViperGenerator
//
//  Created by denizgelir on 28.03.2020.
//  Copyright © 2020 denizgelir. All rights reserved.
//

import Foundation

protocol MoviesPresenterInterface: class {

}

class MoviesPresenter {

    unowned var view: MoviesViewControllerInterface
    let router: MoviesRouterInterface?
    let interactor: MoviesInteractorInterface?

    init(interactor: MoviesInteractorInterface, router: MoviesRouterInterface, view: MoviesViewControllerInterface) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension MoviesPresenter: MoviesPresenterInterface {

}
