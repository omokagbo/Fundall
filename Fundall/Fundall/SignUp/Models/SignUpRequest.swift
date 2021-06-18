//
//  SignUpRequest.swift
//  Fundall
//
//  Created by omokagbo on 15/06/2021.
//

import Foundation

struct SignUpRequest: Codable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
    let passwordConfirmation: String
}

//extension SignUpRequest {
//    var asParameter: Parameter {
//        var params: Parameter = [:]
//        return params
//    }
//}
