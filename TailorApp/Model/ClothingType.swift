//
//  ClothingType.swift
//  TailorApp
//
//  Created by Othman Alkous on 3/11/24.
//

import Foundation
enum ClothingEnum: Codable{
    case Dress
    case Dishdasha
    case Pants
    case Top
}
struct ClothingType: Codable{
    var type: ClothingEnum
}
