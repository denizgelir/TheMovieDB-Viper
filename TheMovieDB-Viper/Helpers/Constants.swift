//
//  Constants.swift
//  TheMovieDB-Viper
//
//  Created by Deniz Gelir on 3/28/20.
//  Copyright © 2020 Deniz Gelir. All rights reserved.
//

import UIKit

struct Constants {

    struct CellIds {
        static let movieCellId = "movieCellId"
    }
    
    struct Sizes {
        static let tableViewCellHeight: CGFloat = 80
    }
    
    static let apiKey: String  = "0353ccdb8a4f84ce76ec1fc978c5ec14"

    struct BaseURL {
        static let baseURL: String = "https://api.themoviedb.org"
        static let apiURL : String = "?api_key=\(Constants.apiKey)&language=en-US"
        static let popularMoviesURL: String = baseURL + "/3/movie/popular" + apiURL
        static let movieDetailURL: String = baseURL + "/3/movie/"
    }
    
}
