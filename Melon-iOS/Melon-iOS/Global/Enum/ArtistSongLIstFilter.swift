//
//  ArtistSongLIstFilter.swift
//  Melon-iOS
//
//  Created by 성환 on 5/19/26.
//

import Foundation

enum ArtistSongListFilter: String, CaseIterable {
    case hot = "HOT"
    case latest = "LATEST"
    case download = "DOWNLOAD"
    case play = "PLAY"
    
    var displayName: String {
        switch self {
        case .hot: return "인기순"
        case .latest: return "최신순"
        case .download: return "다운로드순"
        case .play: return "플레이순"
        }
    }
}
