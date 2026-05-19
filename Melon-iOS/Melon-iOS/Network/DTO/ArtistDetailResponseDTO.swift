//
//  ArtistDetailDTO.swift
//  Melon-iOS
//
//  Created by 초긍정행운의포춘쿠키 on 5/19/26.
//
import UIKit

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
    let gender: String
    let agency: String
    let awardHistory: [String]
    let description: String
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
