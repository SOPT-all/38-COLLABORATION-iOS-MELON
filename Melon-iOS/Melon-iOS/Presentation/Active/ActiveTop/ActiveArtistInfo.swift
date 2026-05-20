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
    // MARK: - Properties
    
    private var degree: Int = 0

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
    
    init() {
        super.init(frame: .zero)

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
        metaInfoStarStackView.addArrangedSubviews(starButton, starCountLabel)
        metaInfoChatStackView.addArrangedSubviews(chatButton, chatCountLabel)
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
            $0.leading.equalToSuperview().inset(20)
            $0.bottom.equalTo(metaInfoStarStackView.snp.top).offset(-8)
            $0.width.equalTo(249)
        }
        
        degreeIcon.snp.makeConstraints {
            $0.top.equalToSuperview().inset(31)
            $0.trailing.equalToSuperview().inset(18)
            $0.bottom.equalToSuperview().inset(31)
        }
        
        metaInfoStarStackView.snp.makeConstraints {
            $0.top.equalTo(artistNameLabel.snp.bottom).offset(8)
            $0.leading.equalTo(artistNameLabel)
            $0.bottom.equalToSuperview().inset(14)
        }
        
        metaInfoChatStackView.snp.makeConstraints {
            $0.top.equalTo(metaInfoStarStackView.snp.top)
            $0.leading.equalTo(metaInfoStarStackView.snp.trailing).offset(12)
            $0.bottom.equalTo(metaInfoStarStackView.snp.bottom)
        }
        
        shareButton.snp.makeConstraints {
            $0.top.equalTo(metaInfoStarStackView)
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(metaInfoStarStackView.snp.bottom)
            $0.size.equalTo(24)
        }
    }
    
    // MARK: - Functions
    
    func configureArtistInfo(_ response: ArtistDetailResponseDTO) {
        artistNameLabel.text = response.name
        degree = response.activeDegree
        starCountLabel.text = String(response.fanCount)
        chatCountLabel.text = String(response.commentCount)
    }
}
