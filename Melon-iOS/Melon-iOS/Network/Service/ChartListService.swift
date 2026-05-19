//
//  ChartListService.swift
//  Melon-iOS
//
//  Created by h2e on 5/18/26.
//

import Foundation

protocol ChartListService {
    func getChart(filter: ChartFilter) async throws -> ChartListDTO
}

final class DefaultChartListService: ChartListService {
    let network = BaseService.shared

    func getChart(filter: ChartFilter) async throws -> ChartListDTO {
        do {
            let result: ChartListDTO = try await network.request(endPoint: .chartList(filter))
            return result
        } catch {
            print("네트워크 요청 에러: \(error.localizedDescription)")
            throw error
        }
    }
}
