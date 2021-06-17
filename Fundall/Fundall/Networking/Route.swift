//
//  Route.swift
//  Fundall
//
//  Created by omokagbo on 17/06/2021.
//

import Foundation

enum Route {
    static let baseURL = "https://campaign.fundall.io"
    
    case login
    case register
    case getProfile
    case updateAvatar
    
    var description: String {
        switch self {
        case .login:
            return "/api/v1/login"
        case .register:
            return "/api/v1/register"
        case .getProfile:
            return "/v1/base/profile"
        case .updateAvatar:
            return "/v1/base/avatar"
        }
    }
}
