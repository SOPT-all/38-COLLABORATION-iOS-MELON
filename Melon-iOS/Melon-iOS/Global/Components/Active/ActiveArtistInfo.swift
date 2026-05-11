//
//  ActiveArtistInfo.swift
//  Melon-iOS
//
//  Created by 성환 on 5/11/26.
//

import UIKit

import SnapKit
import Then

final class ActiveArtistInfo: BaseView {
    // MARK: - UI Properties
    
    private let artistNameLabel = UILabel()
    private let degreeIcon = UIImageView()
    
    private let metaInfoStarStackView = UIStackView()
    private let starButton = UIButton()
    private let starCountLabel = UILabel()
    
    private let metaInfoChatStackView = UIStackView()
    private let chatButton = UIButton()
    private let chatCountLabel = UILabel()
    
    private let shareButton = UIButton()
    
    // MARK: - Initializer
    
    init(artistName: String, starCount: String, chatCount: String, degree: Int) {
        super.init(frame: .zero)
        artistNameLabel.text = artistName
        starCountLabel.text = starCount
        chatCountLabel.text = chatCount
        degreeIcon.image = {
            switch degree {
            case 20: return .imgActiveDegree20
            case 40: return .imgActiveDegree40
            case 60: return .imgActiveDegree60
            case 80: return .imgActiveDegree80
            default: return .imgActiveDegree0
            }
        }()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Settings
    
    override func setUI() {
        [starButton, starCountLabel].forEach(metaInfoStarStackView.addArrangedSubview)
        [chatButton, chatCountLabel].forEach(metaInfoChatStackView.addArrangedSubview)
        addSubviews(artistNameLabel, degreeIcon, metaInfoStarStackView, metaInfoChatStackView, shareButton)
    }
    
    override func setStyle() {
        artistNameLabel.do {
            $0.textColor = .appWhite
            $0.font = .title_b_36
            $0.numberOfLines = 2
        }
        
        metaInfoStarStackView.do {
            $0.axis = .horizontal
            $0.spacing = 4
            $0.alignment = .center
        }
        
        starButton.do {
            $0.setImage(.icStar, for: .normal)
            $0.setImage(.icStarPressed, for: .selected)
        }
        
        starCountLabel.do {
            $0.textColor = .appWhite
            $0.font = .body_r_14
        }
        
        metaInfoChatStackView.do {
            $0.axis = .horizontal
            $0.spacing = 4
            $0.alignment = .center
        }
        
        chatButton.do {
            $0.setImage(.icChat, for: .normal)
        }
        
        chatCountLabel.do {
            $0.textColor = .appWhite
            $0.font = .body_r_14
        }
        
        shareButton.do {
            $0.setImage(.icShare, for: .normal)
        }
    }
    
    override func setLayout() {
        artistNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
            $0.width.equalTo(249)
        }
        
        degreeIcon.snp.makeConstraints {
            $0.top.equalToSuperview().inset(31)
            $0.trailing.equalToSuperview().inset(18)
        }
        
        metaInfoStarStackView.snp.makeConstraints {
            $0.top.equalTo(artistNameLabel.snp.bottom).offset(8)
            $0.leading.equalTo(artistNameLabel)
            $0.bottom.equalToSuperview()
        }
        
        metaInfoChatStackView.snp.makeConstraints {
            $0.top.equalTo(metaInfoStarStackView)
            $0.leading.equalTo(metaInfoStarStackView.snp.trailing).offset(12)
        }
        
        shareButton.snp.makeConstraints {
            $0.top.equalTo(metaInfoStarStackView)
            $0.trailing.equalToSuperview().inset(20)
            $0.size.equalTo(24)
        }
    }
}
