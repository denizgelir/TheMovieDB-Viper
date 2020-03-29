//
//  MovieDetailViewController.swift
//  CIViperGenerator
//
//  Created by denizgelir on 29.03.2020.
//  Copyright © 2020 denizgelir. All rights reserved.
//

import UIKit
import Kingfisher

protocol MovieDetailViewControllerInterface: class {
    func showMovieDetail(movie:MovieDetail)
}

class MovieDetailViewController: UIViewController {
    
    lazy var moviePoster : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    lazy var overviewLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    var presenter: MovieDetailPresenterInterface!
    var movieId: Int!
    fileprivate let imageURLPrefix = "https://image.tmdb.org/t/p/w500/"

    override func viewDidLoad() {
        setupLayout()
        presenter?.getMovieDetail(movieId: movieId)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        presenter?.viewDidAppear()
    }
    
    private func setupLayout() {
        let safeArea = self.view.safeAreaLayoutGuide
        view.backgroundColor = .white
        view.addSubviews(moviePoster,titleLabel,overviewLabel)
        moviePoster.anchor(top: safeArea.topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 20, left: 0, bottom: 0, right: 0), size: .init(width: 160, height: 230))
        moviePoster.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        titleLabel.anchor(top: moviePoster.bottomAnchor, leading: safeArea.leadingAnchor, bottom: nil, trailing: safeArea.trailingAnchor, padding: .init(top: 25, left: 20, bottom: 0, right: 20))
        overviewLabel.anchor(top: titleLabel.bottomAnchor, leading: safeArea.leadingAnchor, bottom: nil, trailing: safeArea.trailingAnchor, padding: .init(top: 10, left: 20, bottom: 0, right: 20))
    }
    
}

extension MovieDetailViewController: MovieDetailViewControllerInterface {
    
    func showMovieDetail(movie: MovieDetail) {
        titleLabel.text = movie.title
        overviewLabel.text = movie.overview
        let urlString = "\(self.imageURLPrefix)\((movie.posterPath) ?? "")"
        moviePoster.kf.setImage(with: URL(string: urlString))
    }
    
}
