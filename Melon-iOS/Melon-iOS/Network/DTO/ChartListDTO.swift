//
//  ChartListDTO.swift
//  Melon-iOS
//
//  Created by h2e on 5/13/26.
//

struct ChartListDTO: Decodable {
    let songs: [ChartSongDTO]
}

struct ChartSongDTO: Decodable {
    let songId: Int
    let title: String
    let artist: ArtistDTO
    let albumImageUrl: String?
}

struct ArtistDTO: Decodable {
    let artistId: Int
    let name: String
}
