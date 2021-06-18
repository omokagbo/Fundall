//
//  NetworkService.swift
//  Fundall
//
//  Created by omokagbo on 17/06/2021.
//

import Foundation

typealias Parameter = [String: Any]

struct NetworkService {
    
    static let shared = NetworkService()
    
    private init() {}
    
    func registerUser(completion: @escaping(Result<SignUpRequest, Error>) -> Void) {
        request(route: .register, method: .post, completion: completion)
    }
    
    func authenticateUser(completion: @escaping(Result<LoginRequest, Error>) -> Void) {
        request(route: .login, method: .post, completion: completion)
    }
    
    func updateAvatar(completion: @escaping(Result<AvatarRequest, Error>) -> Void) {
        request(route: .updateAvatar, method: .post, completion: completion)
    }
    
    func getUserData(completion: @escaping(Result<ProfileRequest, Error>) -> Void) {
        request(route: .getProfile, method: .get, completion: completion)
    }
    
    /// This function helps to generate a URLRequest
    /// - Parameters:
    ///   - route: Path to the resource in the backend
    ///   - method: Type of request to be made
    ///   - parameters: Any extra information needed to be passed to the backend
    /// - Returns: URLRequest
    private func createRequest(route: Route,
                               method: Method,
                               parameters: Parameter? = nil) -> URLRequest? {
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
    
    /// This function is used to make a network request by calling the URLSession
    /// - Parameters:
    ///   - route: Path to the resource in the backend
    ///   - method: Type of request to be made
    ///   - parameters: Any extra information needed to be passed to the backend
    ///   - type: the type of input it expects
    ///   - completion: completion to show if the request failed or not
    private func request<T: Codable>(route: Route,
                            method: Method,
                            parameters: Parameter? = nil,
                            completion: @escaping(Result<T, Error>) -> Void) {
        guard let request = createRequest(route: route, method: method, parameters: parameters) else {
            completion(.failure(AppError.unknownError))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            var result: Result<Data, Error>?
            if let data = data {
                result = .success(data)
                let responseString = String(data: data, encoding: .utf8) ?? "Could not convert to string"
                print("\(responseString)")
            } else if let error = error {
                result = .failure(error)
                print("\(error.localizedDescription)")
            }
            
            DispatchQueue.main.async {
                // Decode result and send back to the user
                self.handleResponse(result: result, completion: completion)
            }
            
        }.resume()
    }
    
    private func handleResponse<T: Codable>(result: Result<Data, Error>?,
                                            completion: (Result<T, Error>) -> Void) {
        guard let result = result else {
            completion(.failure(AppError.unknownError))
            return
        }
        switch result {
        case .success(let data):
            guard let response = try? JSONDecoder().decode(APIResponse<T>.self, from: data) else {
                completion(.failure(AppError.errorDecoding))
                return
            }
            if let error = response.error {
                completion(.failure(AppError.serverError(error)))
                return
            }
            if let decodedData = response.data {
                completion(.success(decodedData))
            } else {
                completion(.failure(AppError.unknownError))
            }
            
        case .failure(let error):
            completion(.failure(error))
        }
    }
    
}
