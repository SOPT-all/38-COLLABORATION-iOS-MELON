//
//  HomeHeaderView.swift
//  Melon-iOS
//
//  Created by h2e on 5/12/26.
//

import UIKit

import SnapKit
import Then

final class HomeHeaderView: BaseView {
    
    private let logoImageView = UIImageView()
    private let diamondButton = UIButton()
    private let cashButton = UIButton()
    
    override func setUI() {
        addSubviews(logoImageView, diamondButton, cashButton)
    }
    
    override func setStyle() {
        logoImageView.do {
            $0.image = .icLogo
            $0.contentMode = .scaleAspectFit
        }
        
        diamondButton.do {
            $0.setImage(.icTopNaviVip, for: .normal)
        }
        
        cashButton.do {
            $0.setImage(.icTopNaviC, for: .normal)
        }
    }
    
    override func setLayout() {
        logoImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(10)
            $0.centerY.equalToSuperview()
        }
        
        diamondButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(251)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(20)
        }
        
        cashButton.snp.makeConstraints {
            $0.leading.equalTo(diamondButton.snp.leading).offset(79)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(26)
        }
    }
}
