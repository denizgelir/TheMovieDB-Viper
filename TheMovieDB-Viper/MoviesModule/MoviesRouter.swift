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

}

class MoviesRouter: NSObject {

    weak var presenter: MoviesPresenterInterface?

    static func setupModule() -> MoviesViewController {
        let vc = MoviesViewController()
        let interactor = MoviesInteractor()
        let router = MoviesRouter()
        let presenter = MoviesPresenter(interactor: interactor, router: router, view: vc)
        vc.presenter = presenter
        router.presenter = presenter
        interactor.presenter = presenter
        return vc
}
    
}

extension MoviesRouter: MoviesRouterInterface {

}

