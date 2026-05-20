//
//  EndPoint.swift
//  Melon-iOS
//
//  Created by 이상엽 on 5/18/26.
//

enum EndPoint {
    case songDetail(Int)
    case chartList(ChartFilter)
    case artistDetail(Int)
    
    var requestType: HTTPMethodType {
        switch self {
        case .songDetail, .chartList, .artistDetail:
            return .get
        }
    }
    
    var url: String {
        switch self {
        case .songDetail(let songId):
            return "/v1/songs/\(songId)"
        case .chartList(let filter):
            return "/v1/chart?chartFilter=\(filter.rawValue)"
        case .artistDetail(let artistId):
            return "/v1/artists/\(artistId)"
        }
    }
    
    var header: [String: String] {
        switch self {
        case .songDetail, .artistDetail:
            return HeaderType.auth.value
        case .chartList:
            return HeaderType.basic.value
        }
    }
}
