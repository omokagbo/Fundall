//
//  NetworkService.swift
//  Fundall
//
//  Created by omokagbo on 17/06/2021.
//

import Foundation

typealias Parameter = [String: Any]?

struct NetworkService {
    
    /// This function helps to generate a URLRequest
    /// - Parameters:
    ///   - route: Path to the resource in the backend
    ///   - method: Type of request to be made
    ///   - parameters: Any extra information needed to be passed to the backend
    /// - Returns: URLRequest
    private func createRequest(route: Route,
                               method: Method,
                               parameters: Parameter = nil) -> URLRequest? {
        let urlString = Route.baseURL + route.description
        guard let url = urlString.asURL else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.addValue("Bearer 'API_TOKEN'", forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = method.rawValue
        
        if let params = parameters {
            switch method {
            case .get:
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = params.map { URLQueryItem(name: $0, value: "\($1)") }
                urlRequest.url = urlComponent?.url
            case .post, .put, .patch, .delete:
                let bodyData = try? JSONSerialization.data(withJSONObject: params, options: [])
                urlRequest.httpBody = bodyData
            }
        }
        return urlRequest
    }
    
    private func request<T>(route: Route, method: Method, parameters: Parameter?, type: T) {
        
    }
    
}
