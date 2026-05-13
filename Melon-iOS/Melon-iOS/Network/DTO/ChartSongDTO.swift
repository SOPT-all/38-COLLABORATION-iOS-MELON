//
//  ChartSongDTO.swift
//  Melon-iOS
//
//  Created by h2e on 5/13/26.
//

import Foundation

struct ChartResponseDTO: Decodable {
    let status: Int
    let code: String
    let message: String
    let songs: [ChartSongDTO]
}

struct ChartSongDTO: Decodable {
    let songId: Int
    let title: String
    let artist: ArtistDTO
    let albumImageUrl: String
}

struct ArtistDTO: Decodable {
    let artistId: Int
    let name: String
}
