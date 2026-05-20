//
//  ArtistType.swift
//  Melon-iOS
//
//  Created by 초긍정행운의포춘쿠키 on 5/20/26.
//

enum ArtistType: String, Decodable {
    case solo = "SOLO"
    case group = "GROUP"
    
    var displayText: String {
        switch self {
        case .solo:
            return "솔로"
        case .group:
            return "그룹"
        }
    }
}
