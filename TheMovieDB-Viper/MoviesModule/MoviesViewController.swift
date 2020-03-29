//
//  MoviesViewController.swift
//  CIViperGenerator
//
//  Created by denizgelir on 28.03.2020.
//  Copyright © 2020 denizgelir. All rights reserved.
//

import UIKit

protocol MoviesViewControllerInterface: class {
    
}

class MoviesViewController: UIViewController {
    var presenter: MoviesPresenterInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
    }
}

extension MoviesViewController: MoviesViewControllerInterface {
    
}
