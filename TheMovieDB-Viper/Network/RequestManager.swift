//
//  RequestManager.swift
//  TheMovieDB-Viper
//
//  Created by Deniz Gelir on 3/28/20.
//  Copyright © 2020 Deniz Gelir. All rights reserved.
//

import Foundation

class RequestManager {
    
    static let shared: RequestManager = {
        let instance = RequestManager()
        return instance
    }()

//    func getPopularMovies(completionHandler: @escaping (Results<DriverModel>) -> ()) {
//        NetworkManager.shared.request(Router.driver, decodeToType: DriverModel.self, completionHandler: completionHandler)
//    }
    
}
