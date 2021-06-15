//
//  Endpoint.swift
//  Fundall
//
//  Created by omokagbo on 15/06/2021.
//

import Foundation

protocol Endpoint {
    var base: String { get }
    var path: String { get }
}

extension Endpoint {
    var urlComponents: URLComponents? {
        guard var components = URLComponents(string: base) else {
            return nil
        }
        components.path = path
        return components
    }
    
    var request: URLRequest? {
        guard let url = urlComponents?.url ?? URL(string: "\(self.base)\(self.path)") else {
            return nil
        }
        let request = URLRequest(url: url)
        return request
    }
}
