//
//  EndPoint.swift
//  Melon-iOS
//
//  Created by 이상엽 on 5/18/26.
//

enum EndPoint {
    case songDetail(Int)
    
    var requestType: HTTPMethodType {
        switch self {
        case .songDetail:
            return .get
        }
    }
    
    var url: String {
        switch self {
        case .songDetail(let songId):
            return "/v1/songs/\(songId)"
        }
    }
    
    var header: [String: String] {
        switch self {
        case .songDetail:
            return HeaderType.auth.value
        }
    }
}
