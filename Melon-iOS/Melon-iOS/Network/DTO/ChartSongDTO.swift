//
//  ChartSongDTO.swift
//  Melon-iOS
//
//  Created by h2e on 5/13/26.
//

import UIKit /// 실제 api 연결 시 수정 예정

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

/// 더미 데이터 API 연동 시 제거할 예정
struct ChartSong {
    let songId: Int
    let title: String
    let artistName: String
    let albumImageUrl: UIImage
}

extension ChartSongDTO {
    static let dummy: [ChartSong] = [
        .init(songId: 1, title: "소문의 낙원",
              artistName: "AKMU (악뮤)",
              albumImageUrl: UIImage(resource: .imgHomeMelonchart1)),
        
        .init(songId: 2, title: "기쁨, 슬픔, 아름다운 마음",
              artistName: "AKMU (악뮤)",
              albumImageUrl: UIImage(resource: .imgHomeMelonchart1)),
        
        .init(songId: 3, title: "RUDE!",
              artistName: "Hearts2Hearts",
              albumImageUrl: UIImage(resource: .imgHomeMelonchart2)),
        
        .init(songId: 4, title: "IVE",
              artistName: "IVE (아이브)",
              albumImageUrl: UIImage(resource: .imgHomeMelonchart3)),
        
        .init(songId: 5, title: "404(New Era)",
              artistName: "KiiiKiii (키키)",
              albumImageUrl: UIImage(resource: .imgHomeMelonchart4)),
        
        .init(songId: 6, title: "SWIM",
              artistName: "방탄소년단",
              albumImageUrl: UIImage(resource: .imgHomeMelonchart5)),
        
        .init(songId: 7, title: "사랑하게 될 거야",
              artistName: "한로로",
              albumImageUrl: UIImage(resource: .imgHomeMelonchart6)),
        
        .init(songId: 8, title: "Drowning",
              artistName: "WOODZ",
              albumImageUrl: UIImage(resource: .imgHomeMelonchart7))
    ]
}
