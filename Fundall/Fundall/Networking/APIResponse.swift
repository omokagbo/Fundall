//
//  APIResponse.swift
//  Fundall
//
//  Created by omokagbo on 17/06/2021.
//

import Foundation

struct APIResponse<T: Codable>: Codable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
