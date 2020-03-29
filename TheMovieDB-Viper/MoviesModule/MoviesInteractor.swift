//
//  MoviesInteractor.swift
//  CIViperGenerator
//
//  Created by denizgelir on 28.03.2020.
//  Copyright © 2020 denizgelir. All rights reserved.
//

import Foundation

protocol MoviesInteractorInterface: class {

}

class MoviesInteractor {
    weak var presenter: MoviesPresenterInterface?
}

extension MoviesInteractor: MoviesInteractorInterface {

}
