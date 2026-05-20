//
//  EndPoint.swift
//  Melon-iOS
//
//  Created by 이상엽 on 5/18/26.
//

enum EndPoint {
    case songDetail(Int)
    case chartList(ChartFilter)
    case artistSongList(Int, ArtistSongListFilter)
    case artistDetail(Int)
    case like(Int)
    
    var requestType: HTTPMethodType {
        switch self {
        case .songDetail, .chartList, .artistSongList, .artistDetail:
            return .get
        case .like:
            return .post
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
        case .artistSongList(let artistId, let filter):
            return "/v1/artists/\(artistId)/songs?sort=\(filter.rawValue)"
        case .like(let songId):
            return "/v1/songs/\(songId)/like"
        }
    }
    
    var header: [String: String] {
        switch self {
        case .songDetail, .artistDetail, .artistSongList, .like:
            return HeaderType.auth.value
        case .chartList:
            return HeaderType.basic.value
        }
    }
}
