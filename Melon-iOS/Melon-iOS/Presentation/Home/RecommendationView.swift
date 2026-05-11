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
    
    private let recommendHeaderView = ReuseHeaderView(subtitle: "김렛솝 님을 위한", title: "맞춤 추천", icon: .iconBrand1Green)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setStyle() {
    }
    
    override func setUI() {
        addSubviews(subtitleLabel, titleLabel, recommendIconView)
    }
    
    override func setLayout() {
        
    }
}
