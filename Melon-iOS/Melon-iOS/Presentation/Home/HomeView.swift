//
//  HomeView.swift
//  Melon-iOS
//
//  Created by h2e on 5/12/26.
//

import UIKit

import SnapKit
import Then

final class HomeView: BaseView {
    private let scrollView = UIScrollView()
    private let contentStackView = UIStackView()
    
    private let homeHeader = HomeHeaderView()
    private let recommendationView = RecommendationSectionView()
    private let chartView = ChartSectionView()
    private let eventView = EventSectionView()
    private let musicPlayerBar = MusicPlayerBar(title: "KARMA COLLECTOR", artist: "식케이 (Sik-k), 김하온 (HAON),N...")

    override func setUI() {
        contentStackView.addArrangedSubviews(
            homeHeader,
            recommendationView,
            chartView,
            eventView
        )
        scrollView.addSubview(contentStackView)
        addSubviews(scrollView, musicPlayerBar)
    }

    override func setStyle() {
        backgroundColor = .appBlack
        contentStackView.do {
            $0.axis = .vertical
            $0.alignment = .fill
            $0.spacing = 36
        }
        
        scrollView.do {
            $0.contentInset.bottom = 70
        }
    }

    override func setLayout() {
        scrollView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.horizontalEdges.bottom.equalToSuperview()
        }

        contentStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(scrollView.snp.width)
        }

        contentStackView.setCustomSpacing(0, after: homeHeader)
        
        musicPlayerBar.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(70)
        }
    }
}
