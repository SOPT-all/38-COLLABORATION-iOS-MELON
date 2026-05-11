//
//  ActiveHeroSection.swift
//  Melon-iOS
//
//  Created by 성환 on 5/11/26.
//

import UIKit

import SnapKit
import Then

final class ActiveHeroSection: BaseView {
    // MARK: - UI Properties
    
    private let artistImage = UIImageView()
    
    private let artistInfoView = ActiveArtistInfo(artistName: "Hearts2Hearts (하츠투하츠)", starCount: "30,037", chatCount: "14,027", degree: 20)
    
    private let mixUpButton = UIButton()
    
    // MARK: - UI Setting
    
    override func setUI() {
        addSubviews(artistImage, artistInfoView, mixUpButton)
    }
    
    override func setStyle() {
        artistImage.do {
            $0.image = .imgActiveH2H
        }
        
        mixUpButton.do {
            var config = UIButton.Configuration.plain()
            config.image = .imgMixup.resize(to: CGSize(width: 26, height: 26))
            config.imagePadding = 8
            config.background.cornerRadius = 4
            config.attributedTitle = AttributedString(
                "아티스트 믹스업",
                attributes: AttributeContainer([
                    .font: UIFont.body_r_15,
                    .foregroundColor: UIColor.appWhite
                ])
            )
            $0.configuration = config
            $0.clipsToBounds = true
            $0.backgroundColor = .gray600
        }
    }
    
    override func setLayout() {
        artistImage.snp.makeConstraints {
            $0.top.equalToSuperview()
        }
        
        artistInfoView.snp.makeConstraints {
            $0.bottom.equalTo(mixUpButton.snp.top).offset(-14)
            $0.horizontalEdges.equalToSuperview()
        }
        
        mixUpButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(18)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.width.equalTo(335)
            $0.height.equalTo(48)
        }
    }
}
