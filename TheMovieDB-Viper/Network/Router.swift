//
//  Router.swift
//  TheMovieDB-Viper
//
//  Created by Deniz Gelir on 3/28/20.
//  Copyright © 2020 Deniz Gelir. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    
    case getPopularMovies
    case getMovieDetail(movieId:Int)
    
    var method: HTTPMethod {
        switch self {
        case .getPopularMovies,.getMovieDetail:
            return .get
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .getPopularMovies,.getMovieDetail:
            return nil
        }
    }
    
    var url: URL {
        switch self {
        case .getPopularMovies:
            let url = URL(string: Constants.BaseURL.popularMoviesURL)!
            return url
        case .getMovieDetail(let movieId):
            let url = URL(string: Constants.BaseURL.movieDetailURL + String(movieId) + Constants.BaseURL.apiURL)!
            return url
        }
    }
    
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return try encoding.encode(urlRequest, with: parameters)
    }
}
