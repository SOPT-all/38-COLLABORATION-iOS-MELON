//
//  SongListService.swift
//  Melon-iOS
//
//  Created by 성환 on 5/19/26.
//

import Foundation

protocol SongListService {
    func getSongList(artistId: Int, sort: ArtistSongListFilter) async throws -> SongListDTO
}

final class DefaultSongListService: SongListService {
    let network = BaseService.shared
    
    func getSongList(artistId: Int, sort: ArtistSongListFilter) async throws -> SongListDTO {
        do {
            let result: SongListDTO = try await network.request(endPoint: .artistSongList(artistId, sort))
            return result
        } catch {
            print("네트워크 요청 에러: \(error.localizedDescription)")
            throw error
        }
    }
}
