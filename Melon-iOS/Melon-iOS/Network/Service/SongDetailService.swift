//
//  SongDetailService.swift
//  Melon-iOS
//
//  Created by 이상엽 on 5/18/26.
//

import Foundation

protocol SongDetailService {
    func getSongDetail(songId: Int) async throws -> SongDetailResponseDTO
    func postLikeSong(songId: Int) async throws -> LikeResponseDTO
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
    
    func postLikeSong(songId: Int) async throws -> LikeResponseDTO {
        do {
            let result: LikeResponseDTO = try await network.request(endPoint: .like(songId))
            return result
        } catch {
            print("네트워크 요청 에러: \(error)")
            throw error
        }
    }
}
