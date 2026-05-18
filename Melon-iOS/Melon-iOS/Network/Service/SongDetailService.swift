//
//  SongDetailService.swift
//  Melon-iOS
//
//  Created by 이상엽 on 5/18/26.
//

import Foundation

protocol SongDetailService {
    func getSongDetail(songId: Int) async throws -> SongDetailResponseDTO
}

final class DefaultSongDetailService: SongDetailService {
    let network = BaseService.shared

    func getSongDetail(songId: Int) async throws -> SongDetailResponseDTO {
        do {
            let result: SongDetailResponseDTO = try await network.request(endPoint: .songDetail(songId))
            return result
        } catch {
            print("네트워크 요청 에러: \(error.localizedDescription)")
            throw error
        }
    }
}
