//
//  MoviesViewController.swift
//  CIViperGenerator
//
//  Created by denizgelir on 28.03.2020.
//  Copyright © 2020 denizgelir. All rights reserved.
//

import UIKit

protocol MoviesViewControllerInterface: class {
    func setupTableView()
    func reloadTableView()
}

class MoviesViewController: UIViewController {
    var presenter: MoviesPresenterInterface!
    
    lazy var tableView : UITableView = {
       let tv = UITableView()
       let tableView = UITableView(frame: self.view.frame)
       return tv
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        presenter?.viewDidAppear()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        self.title = "Popular Movies"
        self.view.addSubview(tableView)
        tableView.fillSuperview()
    }
    
    
}

extension MoviesViewController: MoviesViewControllerInterface {
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.CellIds.movieCellId)
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
    
}

extension MoviesViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIds.movieCellId, for: indexPath)
        let movie = presenter.getMovieItems(at: indexPath.row)
        cell.textLabel?.text = movie.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.Sizes.tableViewCellHeight
    }
    
}
