//
//  SongListDTO.swift
//  Melon-iOS
//
//  Created by 성환 on 5/13/26.
//

import UIKit

struct SongListDTO: Decodable {
    let status: Int
    let code: String
    let message: String
    let data: SongListDataDTO
}

struct SongListDataDTO: Decodable {
    let songId: Int
    let title: String
    let artist: SongListArtistDTO
    let albumImageUrl: String
}

struct SongListArtistDTO: Decodable {
    let artistId: Int
    let name: String
}

/// 더미 데이터 API 연동 시 제거할 예정
struct SongListItemModel {
    let songId: Int
    let title: String
    let artist: SongListArtistDTO
    let albumImageUrl: UIImage
}

extension SongListDTO {
    static func dummy() -> [SongListItemModel] {
        return [
            SongListItemModel(
                songId: 1,
                title: "RUDE! (Silly Silky Remix)",
                artist: SongListArtistDTO(
                    artistId: 1,
                    name: "Hearts2Hearts (하츠투하츠), Sillllll"
                ),
                albumImageUrl: .imgActiveAlbumH2Hruderemix
            ),
            SongListItemModel(
                songId: 2,
                title: "RUDE! (yunji Remix)",
                artist: SongListArtistDTO(
                    artistId: 2,
                    name: "Hearts2Hearts (하츠투하츠), yunjiii"
                ),
                albumImageUrl: .imgActiveAlbumH2Hruderemix
            ),
            SongListItemModel(
                songId: 3,
                title: "RUDE! (Japanese Ver.)",
                artist: SongListArtistDTO(
                    artistId: 3,
                    name: "Hearts2Hearts (하츠투하츠)"
                ),
                albumImageUrl: .imgActiveAlbumH2Hrudejapan
            ),
            SongListItemModel(
                songId: 4,
                title: "RUDE!",
                artist: SongListArtistDTO(
                    artistId: 3,
                    name: "Hearts2Hearts (하츠투하츠)"
                ),
                albumImageUrl: .imgActiveAlbumH2Hrude
            ),
            SongListItemModel(
                songId: 5,
                title: "The Chase (0to Remix)",
                artist: SongListArtistDTO(
                    artistId: 3,
                    name: "Hearts2Hearts (하츠투하츠)"
                ),
                albumImageUrl: .imgActiveAlbumH2Hthechase
            ),
            SongListItemModel(
                songId: 1,
                title: "RUDE! (Silly Silky Remix)",
                artist: SongListArtistDTO(
                    artistId: 1,
                    name: "Hearts2Hearts (하츠투하츠), Sillllll"
                ),
                albumImageUrl: .imgActiveAlbumH2Hruderemix
            ),
            SongListItemModel(
                songId: 2,
                title: "RUDE! (yunji Remix)",
                artist: SongListArtistDTO(
                    artistId: 2,
                    name: "Hearts2Hearts (하츠투하츠), yunjiii"
                ),
                albumImageUrl: .imgActiveAlbumH2Hruderemix
            ),
            SongListItemModel(
                songId: 3,
                title: "RUDE! (Japanese Ver.)",
                artist: SongListArtistDTO(
                    artistId: 3,
                    name: "Hearts2Hearts (하츠투하츠)"
                ),
                albumImageUrl: .imgActiveAlbumH2Hrudejapan
            ),
            SongListItemModel(
                songId: 4,
                title: "RUDE!",
                artist: SongListArtistDTO(
                    artistId: 3,
                    name: "Hearts2Hearts (하츠투하츠)"
                ),
                albumImageUrl: .imgActiveAlbumH2Hrude
            ),
            SongListItemModel(
                songId: 5,
                title: "The Chase (0to Remix)",
                artist: SongListArtistDTO(
                    artistId: 3,
                    name: "Hearts2Hearts (하츠투하츠)"
                ),
                albumImageUrl: .imgActiveAlbumH2Hthechase
            )
        ]
    }
}
