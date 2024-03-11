//
//  Request.swift
//  TailorApp
//
//  Created by Othman Alkous on 3/11/24.
//

import Foundation
struct Request: Codable{
    var receptionMethod: String
    var requestId: Int?
    var userId: Int?
    var tailorId: Int?
    var orderStatus: String
}
