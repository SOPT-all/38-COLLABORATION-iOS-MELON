//
//  ArtistDetailDTO.swift
//  Melon-iOS
//
//  Created by 초긍정행운의포춘쿠키 on 5/19/26.
//
import Foundation

struct ArtistDetailResponseDTO: Decodable {
    let artistId: Int
    let name: String
    let fanCount: Int
    let commentCount: Int
    let activeDegree: Int
    let imageUrl: String
    let type: ArtistType
    let artists: [ArtistMemberDTO]
    let recentAlbums: [RecentAlbumDTO]
    let credit: String
    let yearMonth: String
    let country: String
    let gender: ArtistGender
    let agency: String
    let awardHistory: [String]
    let description: String
}

enum ArtistGender: String, Decodable {
    case female = "F"
    case male = "M"
    
    var displayText: String {
        switch self {
        case .female:
            return "여성"
        case .male:
            return "남성"
        }
    }
}

struct ArtistMemberDTO: Decodable {
    let artistId: Int
    let name: String
    let imageUrl: String
}

struct RecentAlbumDTO: Decodable {
    let albumId: Int
    let title: String
    let artistName: String
    let imageUrl: String
}
