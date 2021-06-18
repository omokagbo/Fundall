//
//  LoginResponse.swift
//  Fundall
//
//  Created by omokagbo on 15/06/2021.
//

import Foundation

struct LoginResponse: Codable {
    let response: LoginResponseType?
}

struct LoginResponseType: Codable {
    let user: User?
    let status: String?
}

struct User: Codable {
    let id: Int?
    let firstName: String?
    let lastName: String?
    let email: String?
    let avatar: String?
    let monthlyTarget: Int?
    let dateCreated: String?
    let dateUpdated: String?
    let accessToken: String?
    let tokenType: String?
    let expiryDate: String?
}
