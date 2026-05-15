//
//  FanTabScrollView.swift
//  Melon-iOS
//
//  Created by 초긍정행운의포춘쿠키 on 5/15/26.
//

import UIKit

import SnapKit
import Then

final class FanTabScrollView: BaseView {
    
    private let scrollView = UIScrollView()
    private let contentStackView = UIStackView()
    
    private let fanTalkSection = FanTalkSectionView()
    
    private let myActivitySection = MyActivitySectionView()
    
    override func setStyle() {
        scrollView.do {
            $0.showsVerticalScrollIndicator = false
            $0.backgroundColor = .appBlack
        }
        
        contentStackView.do {
            $0.axis = .vertical
            $0.alignment = .fill
            $0.distribution = .fill
            $0.spacing = 46
        }
    }
    
    override func setUI() {
        backgroundColor = .appBlack
        addSubview(scrollView)
        scrollView.addSubview(contentStackView)
        contentStackView.addArrangedSubviews(fanTalkSection,myActivitySection)
    }
    
    override func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentStackView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
        }
    }
}
