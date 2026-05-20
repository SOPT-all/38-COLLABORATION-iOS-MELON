//
//  SongListDTO.swift
//  Melon-iOS
//
//  Created by 성환 on 5/13/26.
//

import UIKit

struct SongListDTO: Decodable {
    let artistSong: [artistSongDTO]
}

struct artistSongDTO: Decodable {
    let songId: Int
    let title: String
    let artist: SongListArtistDTO
    let albumImageUrl: String
}

struct SongListArtistDTO: Decodable {
    let artistId: Int
    let name: String
}
