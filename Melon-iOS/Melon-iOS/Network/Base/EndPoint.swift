//
//  EndPoint.swift
//  Melon-iOS
//
//  Created by 이상엽 on 5/18/26.
//

enum EndPoint {
    case songDetail(Int)
    case artistDetail
    
    var requestType: HTTPMethodType {
        switch self {
        case .songDetail:
            return .get
        case .artistDetail:
            return .get
        }
    }
    
    var url: String {
        switch self {
        case .songDetail(let songId):
            return "/v1/songs/\(songId)"
        case .artistDetail(let aritistId):
            return "/v1/artists/\(artistId)"
        
        }
    }
    
    var header: [String: String] {
        switch self {
        case .songDetail:
            return HeaderType.auth.value
        case .artistDetail:
            return HeaderType.auth.value
        }
    }
}
