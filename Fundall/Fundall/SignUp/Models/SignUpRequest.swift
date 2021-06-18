//
//  SignUpRequest.swift
//  Fundall
//
//  Created by omokagbo on 15/06/2021.
//

import Foundation

struct SignUpRequest {
    let firstname: String
    let lastname: String
    let email: String
    let password: String
    let passwordConfirmation: String
}

extension SignUpRequest {
    var asParameter: Parameter {
        return [
            "firstname": firstname,
            "lastname": lastname,
            "email": email,
            "password": password,
            "password_confirmation": password
        ]
    }
}
