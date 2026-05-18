//
//  SongDetailResponseDTO.swift
//  Melon-iOS
//
//  Created by 이상엽 on 5/18/26.
//

import Foundation

struct SongDetailResponseDTO: Decodable {
    let songId: Int
    let title: String
    let artists: [ArtistInfo]
    let album: AlbumInfo
    let likeCount: Int
    let isLiked: Bool
    let playTime: String
}

struct ArtistInfo: Decodable {
    let artistId: Int
    let name: String
}

struct AlbumInfo: Decodable {
    let albumId: Int
    let title: String
    let imageUrl: String
}
