//
//  AlbumListDTO.swift
//  Melon-iOS
//
//  Created by 성환 on 5/13/26.
//

import UIKit

struct AlbumListDTO: Decodable {
    let albumId: Int
    let title: String
    let artistName: String
    let imageUrl: String
}

/// 앨범리스트 더미데이터 모델
struct AlbumListModel {
    let albumId: Int
    let title: String
    let artistName: String
    let imageUrl: UIImage
}

extension AlbumListDTO {
    static func dummy() -> [AlbumListModel] {
        return [
            AlbumListModel(
                albumId: 1,
                title: "iScreaM Vol.39 : RUDE! Remixes",
                artistName: "Hearts2Hearts (하츠투하츠)",
                imageUrl: .imgActiveAlbumH2Hruderemix
            ),
            AlbumListModel(
                albumId: 2,
                title: "RUDE! (Japanese Ver.)",
                artistName: "Hearts2Hearts (하츠투하츠)",
                imageUrl: .imgActiveAlbumH2Hrudejapan
            ),
            AlbumListModel(
                albumId: 3,
                title: "RUDE!",
                artistName: "Hearts2Hearts (하츠투하츠)",
                imageUrl: .imgActiveAlbumH2Hrude
            )
        ]
    }
}
