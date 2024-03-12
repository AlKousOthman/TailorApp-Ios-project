//
//  User.swift
//  TailorApp
//
//  Created by Othman Alkous on 3/11/24.
//

import Foundation
struct User: Codable {
    var name: String
    var userName: String
    var email: String
    var address: String
    var phoneNumber: String
    var password: String
    var userId: Int?
}
