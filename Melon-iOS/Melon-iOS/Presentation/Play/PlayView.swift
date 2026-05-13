//
//  PlayView.swift
//  Melon-iOS
//
//  Created by 이상엽 on 5/12/26.
//

import UIKit

import SnapKit
import Then

final class PlayView: BaseView {
    
    // MARK: - UI Components
    
    private let optionButton = UIButton()
    
    private let songTitleLabel = UILabel()
    
    private let artistNameLabel = UILabel()
    
    private let musicInformationStackView = UIStackView()
    
    private let downButton = UIButton()
    
    private let titleStackView = UIStackView()
    
    private lazy var artistChannelButton = UIButton()
    
    private let albumImageView = UIImageView()
    
    private let swipeGuideContainerView = UIView()
    
    private let songCustomButtonStackView = UIStackView()
    
    private let songProgressView = UIProgressView()
    
    private let playButtonStackView = UIStackView()
    
    private let utilButtonStackView = UIStackView()
    
    private let playlistContainerView = UIView()
    
    override func setUI() {
        musicInformationStackView.addArrangedSubviews(songTitleLabel, artistNameLabel)
                
        addSubviews(
            optionButton,
            musicInformationStackView,
            downButton,
            artistChannelButton,
            albumImageView,
            swipeGuideContainerView,
            songCustomButtonStackView,
            songProgressView,
            playButtonStackView,
            utilButtonStackView,
            playlistContainerView
        )
    }
    
    override func setStyle() {
        backgroundColor = .appBlue
        titleStackView.do {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.spacing = 16
        }
        
        optionButton.do {
            $0.setImage(UIImage(resource: .icMoreVertical2), for: .normal)
        }
        
        musicInformationStackView.do {
            $0.axis = .vertical
            $0.alignment = .leading
            $0.spacing = 0
        }
               
        songTitleLabel.do {
            $0.text = "LOV3 (Feet. Bryan Chase어쩌구저쩌구잘리는부분"
            $0.textColor = .appWhite
            $0.font = .title_b_20
        }
        
        artistNameLabel.do {
            $0.text = "식케이 (Sik-K), 김하온 (HAON), NOWIMYOU어쩌구저쩌구잘리는부분"
            $0.textColor = .appWhite
            $0.font = .body_r_13
        }
        
        downButton.do {
            $0.setImage(UIImage(resource: .icChevronDown), for: .normal)
        }
        
        playlistContainerView.do {
            $0.backgroundColor = .gray300
        }
    }
    
    override func setLayout() {
        optionButton.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(16)
            $0.leading.equalToSuperview().inset(20)
            $0.size.equalTo(24)
        }
        
        musicInformationStackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(16)
            $0.leading.equalTo(optionButton.snp.trailing).offset(23)
            $0.trailing.equalTo(downButton.snp.leading).offset(-33)
        }
        
        downButton.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(16)
            $0.trailing.equalToSuperview().inset(20)
            $0.size.equalTo(24)
        }
        
        playlistContainerView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(147)
        }
    }
}
