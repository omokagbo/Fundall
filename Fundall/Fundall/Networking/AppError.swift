//
//  NetworkResponseError.swift
//  Fundall
//
//  Created by omokagbo on 17/06/2021.
//

import Foundation

enum AppError: Error, LocalizedError {
    case invalidToken
    case errorDecoding
    case serverError(String)
    case unknownError
    case forbiddenError
    case invalidURL
    case authenticationError
    case requestFailed
    case invalidData
    
    public var errorDescription: String {
        switch self {
        case .authenticationError:
            return "You need to be authenticated first."
        case .serverError(let error):
            return  error
        case .unknownError:
            return "Oops!! something went wrong"
        case .forbiddenError:
            return "forbiddenError"
        case .invalidURL:
            return "Invalid URL"
        case .invalidToken:
            return "Your token has expired"
        case .requestFailed:
            return "Request Failed"
        case .errorDecoding:
            return "Failed to decode data"
        case .invalidData:
            return "Invalid data"
        }
    }
}
