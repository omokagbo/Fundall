//
//  Result.swift
//  Fundall
//
//  Created by omokagbo on 15/06/2021.
//

import Foundation

enum Result <Success, Failure> where Failure: Error {
    case success(Success)
    case failure(Failure)
}
