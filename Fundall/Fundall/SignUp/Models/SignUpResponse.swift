//
//  SignUpResponse.swift
//  Fundall
//
//  Created by omokagbo on 15/06/2021.
//

import Foundation

struct SignUpResponse: Codable {
    let success: SignUpResponseType
}

struct SignUpResponseType: Codable {
    let message: String
}
