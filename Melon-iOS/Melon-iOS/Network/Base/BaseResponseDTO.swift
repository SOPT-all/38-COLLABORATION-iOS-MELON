//
//  BaseResponseDTO.swift
//  Melon-iOS
//
//  Created by 이상엽 on 5/18/26.
//

import Foundation

struct BaseResponseDTO<T: Decodable>: Decodable {
    let status: Int
    let code: String
    let message: String
    let data: T?
}
