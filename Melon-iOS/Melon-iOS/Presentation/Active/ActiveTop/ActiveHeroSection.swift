//
//  ActiveHeroSection.swift
//  Melon-iOS
//
//  Created by 성환 on 5/11/26.
//

import UIKit

import Kingfisher
import SnapKit
import Then

final class ActiveHeroSection: BaseView {
    // MARK: - UI Properties
    
    private let gradientLayer = CAGradientLayer()
    
    private let artistImage = UIImageView()
    
    let artistInfoView = ActiveArtistInfo()
    
    private let mixUpButton = UIButton()
    
    // MARK: - UI Setting
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.frame = artistImage.bounds
    }
    
    override func setUI() {
        addSubviews(artistImage, artistInfoView, mixUpButton)
        artistImage.layer.addSublayer(gradientLayer)
    }
    
    override func setStyle() {
        gradientLayer.do {
            $0.colors = [
                UIColor.black.cgColor,
                UIColor.clear.cgColor
            ]
            $0.startPoint = CGPoint(x: 0.5, y: 1)
            $0.endPoint = CGPoint(x: 0.5, y: 0)
        }
        
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
            $0.width.equalTo(375)
            $0.height.equalTo(379)
        }
        
        artistInfoView.snp.makeConstraints {
            $0.bottom.equalTo(mixUpButton.snp.top)
            $0.horizontalEdges.equalToSuperview()
        }
        
        mixUpButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(18)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.width.equalTo(335)
            $0.height.equalTo(48)
        }
    }
    
    // MARK: - Functions
    
    func configureActiveHeroSection(_ response: ArtistDetailResponseDTO) {
        let url = URL(string: response.imageUrl)
        artistImage.kf.setImage(with: url)
        
        artistInfoView.configureArtistInfo(response)
    }
}
