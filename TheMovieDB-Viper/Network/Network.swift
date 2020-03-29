//
//  Network.swift
//  TheMovieDB-Viper
//
//  Created by Deniz Gelir on 28.03.2020.
//  Copyright © 2020 Deniz Gelir. All rights reserved.
//

import Foundation
import Alamofire

enum Results<T> {
    case success(T)
    case failure(Error)
}

class NetworkManager {
    
    static let shared: NetworkManager = {
        let instance = NetworkManager()
        return instance
    }()

    func request<T: Codable>(_ request: URLRequestConvertible, decodeToType type: T.Type, completionHandler: @escaping (Results<T>) -> ()) {
        AF.request(request).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decoded = try JSONDecoder().decode(T.self, from: data)
                    completionHandler(.success(decoded))
                } catch {
                    completionHandler(.failure(error))
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
}
