//
//  HomeView.swift
//  Melon-iOS
//
//  Created by h2e on 5/12/26.
//

import SnapKit
import Then
import UIKit

final class HomeView: BaseView {
    private let scrollView = UIScrollView()
    private let contentStackView = UIStackView()
    private let homeHeader = HomeHeaderView()
    private let recommendationView = RecommendationSectionView()
    private let chartView = ChartSectionView()
    private let eventView = EventSectionView()

    override func setUI() {
        contentStackView.addArrangedSubviews(
            homeHeader,
            recommendationView,
            chartView,
            eventView
        )
        scrollView.addSubview(contentStackView)
        addSubview(scrollView)
    }

    override func setStyle() {
        backgroundColor = .appBlack
        contentStackView.do {
            $0.axis = .vertical
            $0.alignment = .fill
            $0.spacing = 0
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

        contentStackView.setCustomSpacing(36, after: recommendationView)
        contentStackView.setCustomSpacing(36, after: chartView)
    }
}
