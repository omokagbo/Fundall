//
//  APIClient.swift
//  Fundall
//
//  Created by omokagbo on 17/06/2021.
//

import Foundation

protocol APIClient {
    var session: URLSession { get }
    func fetch<T: Codable>(with request: URLRequest, decode: @escaping (Codable) -> T?, completion: @escaping (Result<T, APIError>) -> Void)
}


extension APIClient {
    typealias JSONTaskCompletionHandler = (Codable?, APIError?) -> Void
    
}
