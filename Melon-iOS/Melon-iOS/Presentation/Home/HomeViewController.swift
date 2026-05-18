//
//  HomeViewController.swift
//  Melon-iOS
//
//  Created by h2e on 5/12/26.
//

import UIKit

import SnapKit
import Then

final class HomeViewController: BaseViewController {
    private let service: ChartListService = DefaultChartListService()
    
    private let rootView = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindFilter()
        getChart(filter: .top100)
    }
    
    override func loadView() {
        view = rootView
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func bindFilter() {
        rootView.onChartFilterChanged = { [weak self] filter in
            self?.getChart(filter: filter)
        }
    }
    
    private func getChart(filter: ChartFilter) {
        Task {
            do {
                let response = try await service.getChart(filter: filter)
                
                await MainActor.run {
                    self.rootView.chartView.updateChart(items: response.songs)
                }
            } catch {
                print("차트 조회 실패: \(error)")
            }
        }
    }
}
