//
//  API Error.swift
//  Fundall
//
//  Created by omokagbo on 17/06/2021.
//

import Foundation

enum APIError: Error {
    case requestFailed
    case jsonConversionFailure
    case invalidData
    case responseUnsuccessful
    case parsingFailure
    
    var localizedString: String {
        switch self {
        case .requestFailed:
            return "Request Failed"
        case .jsonConversionFailure:
            return "JSON Conversion Failed"
        case .invalidData:
            return "Invalid Data"
        case .responseUnsuccessful:
            return "Response Unsuccessful"
        case .parsingFailure:
            return "Parsing Failed"
        }
    }
}
