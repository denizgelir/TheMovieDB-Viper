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
    
    case popularMovies
    
    var method: HTTPMethod {
        switch self {
        case .popularMovies:
            return .get
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .popularMovies:
            return nil
        }
    }
    
    var url: URL {
        switch self {
        case .popularMovies:
            let url = URL(string: Constants.BaseURL.popularMoviesURL)!
            print(url)
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
