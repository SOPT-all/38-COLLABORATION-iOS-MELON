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
    let artists: [ArtistMember]
    let recentAlbums: [RecentAlbum]
    let credit: String
    let yearMonth: String
    let country: String
    let gender: ArtistGender
    let agency: String
    let awardHistory: [String]
    let description: String
}

struct ArtistMember: Decodable {
    let artistId: Int
    let name: String
    let imageUrl: String
}

struct RecentAlbum: Decodable {
    let albumId: Int
    let title: String
    let artistName: String
    let imageUrl: String
}
