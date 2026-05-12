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
    let scrollView = UIScrollView()
    let contentStackView = UIStackView()
    let homeHeader = HomeHeaderView()
    let recommendationView = RecommendationView()
    
    override func setUI() {
        addSubview(scrollView)
        scrollView.addSubview(contentStackView)
        [homeHeader, recommendationView].forEach(contentStackView.addArrangedSubview)
    }
    
    override func setStyle() {
        backgroundColor = .appBlack
        contentStackView.do {
            $0.axis = .vertical
            $0.alignment = .fill
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
    }
}
