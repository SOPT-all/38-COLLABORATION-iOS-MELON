//
//  RecommendationView.swift
//  Melon-iOS
//
//  Created by h2e on 5/11/26.
//

import UIKit

import SnapKit
import Then

final class RecommendationView: BaseView {
    
    private let mainStackView = UIStackView()
    private let rightStackView = UIStackView()
    
    private let recommendHeaderView = HomeDetailSectionHeaderView(subtitle: "김렛솝 님을 위한", title: "맞춤 추천", icon: .iconBrand1Green)
    
    private let largeCard = RecommendationCard(style: .large, image: .imgHomeMoodplay1, tag: "좋아요 많은", title: "요즘 좋아요를 많이 받은 노래", hashtag: "#요즘뜨는 #장르무관")
        
    private let smallCard1 = RecommendationCard(style: .small, image: .imgHomeMoodplayS1, tag: "여름", title: "날씨가 더워질 때 듣는 음악..", hashtag: "#여름 #POP")
        
    private let smallCard2 = RecommendationCard(style: .small, image: .imgHomeMoodplayS2, tag: "요즘 꽂힌 곡", title: "최근에 자주 들은", hashtag: "#자주들은 #최근꽂힌")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setUI() {
        rightStackView.addArrangedSubviews(smallCard1, smallCard2)
        mainStackView.addArrangedSubviews(largeCard, rightStackView)
        
        addSubviews(recommendHeaderView, mainStackView)
    }
    
    override func setLayout() {
        recommendHeaderView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
        }
        
        mainStackView.snp.makeConstraints {
            $0.top.equalTo(recommendHeaderView.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(12)
            $0.bottom.equalToSuperview()
        }
        
        largeCard.snp.makeConstraints {
            $0.width.equalTo(188)
            $0.height.equalTo(162)
        }
    }
    
    override func setStyle() {
        recommendHeaderView.do {
            $0.setStyle()
            $0.titleLabel.font = .title_b_20
        }
        
        mainStackView.do {
            $0.axis = .horizontal
            $0.spacing = 8
            $0.distribution = .fill
        }
        
        rightStackView.do {
            $0.axis = .vertical
            $0.spacing = 8
            $0.distribution = .fillEqually
        }
    }
}
