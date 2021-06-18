//
//  LoginRequest.swift
//  Fundall
//
//  Created by omokagbo on 15/06/2021.
//

import Foundation

struct LoginRequest {
    let email: String
    let password: String
}

extension LoginRequest {
    var asParameter: Parameter {
        return [
            "email": email,
            "password": password
        ]
    }
}
