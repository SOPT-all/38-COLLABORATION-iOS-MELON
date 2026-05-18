//
//  ArtistDetailService.swift
//  Melon-iOS
//
//  Created by 초긍정행운의포춘쿠키 on 5/19/26.
//

import UIKit

protocol ArtistDetailService {
    func getArtistDetail(artistId: Int) async throws -> ArtistDetailResponseDTO
}

final class DefaultArtistDetailService: ArtistDetailService {
    private let network = BaseService.shared
    
    func getArtistDetail(artistId: Int) async throws -> ArtistDetailResponseDTO {
        do {
            let result: ArtistDetailResponseDTO = try await network.request(endPoint: .artistDetail(artistId))
            return result
        } catch {
            print("아티스트 상세 조회 에러: \(error.localizedDescription)")
            throw error
        }
    }
}
