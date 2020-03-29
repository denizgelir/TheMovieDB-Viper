//
//  MovieDetailRouter.swift
//  CIViperGenerator
//
//  Created by denizgelir on 29.03.2020.
//  Copyright © 2020 denizgelir. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailRouter: NSObject {

    weak var presenter: MovieDetailPresenterInterface?

    static func setupModule() -> MovieDetailViewController {
        let vc = MovieDetailViewController()
        let interactor = MovieDetailInteractor()
        let router = MovieDetailRouter()
        let presenter = MovieDetailPresenter(interactor: interactor, router: router, view: vc)

        vc.presenter = presenter
        router.presenter = presenter
        interactor.output = presenter
        return vc
    }
}



