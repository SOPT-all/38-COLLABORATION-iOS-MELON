//
//  EndPoint.swift
//  Melon-iOS
//
//  Created by 이상엽 on 5/18/26.
//

enum EndPoint {
    case songDetail(Int)
    case chartList(ChartFilter)
    
    var requestType: HTTPMethodType {
        switch self {
        case .songDetail, .chartList:
            return .get
        case .artistDetail:
            return .get
        }
    }
    
    var url: String {
        switch self {
        case .songDetail(let songId):
            return "/v1/songs/\(songId)"
        case .chartList(let filter):
            return "/v1/chart?chartFilter=\(filter.rawValue)"
        }
    }
    
    var header: [String: String] {
        switch self {
        case .songDetail:
            return HeaderType.auth.value
        case .chartList:
            return HeaderType.basic.value
        }
    }
}
