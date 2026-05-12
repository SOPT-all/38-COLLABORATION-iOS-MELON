//
//  MusicPlayerBar.swift
//  Melon-iOS
//
//  Created by 이상엽 on 5/12/26.
//

import UIKit

import SnapKit
import Then

final class MusicPlayerBar: UIButton {
    
    // MARK: - Properties
    
    private let songTitle: String
    private let songArtist: String
    
    // MARK: - UI Components
    
    private let songTitleLabel = UILabel()
    
    private let songArtistLabel = UILabel()
    
    private let previousButton = UIButton()
    private let playButton = UIButton()
    private let nextButton = UIButton()
    private let songListButton = UIButton()
    
    private let playerButtonStackView = UIStackView()
    
    // MARK: - Initializer
    
    init(title: String, artist: String) {
        self.songTitle = title
        self.songArtist = artist
        super.init(frame: .zero)
        
        setUI()
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Methods

    override func layoutSubviews() {
        super.layoutSubviews()

        layer.addBorder(
            position: .bottom,
            color: .gray600,
            width: 1
        )
        
        layer.addBorder(
            position: .top,
            color: .gray600,
            width: 2
        )
    }
    
    private func setUI() {
        backgroundColor = .appBlack
        
        addSubviews(
            songTitleLabel,
            songArtistLabel,
            playerButtonStackView
        )
        
        playerButtonStackView.addArrangedSubviews(
            previousButton,
            playButton,
            nextButton,
            songListButton
        )
    }
    
    private func setStyle() {
        songTitleLabel.do {
            $0.text = songTitle
            $0.font = .body_sb_15
            $0.textColor = .appWhite
        }
        
        songArtistLabel.do {
            $0.text = songArtist
            $0.font = .caption_r_12
            $0.textColor = .gray500
        }
        
        playerButtonStackView.do {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.spacing = 10
        }
        
        previousButton.do {
            $0.setImage(UIImage(resource: .icPlayprevious), for: .normal)
        }
        
        playButton.do {
            $0.setImage(UIImage(resource: .icPlayFilled).resize(to: CGSize(width: 28, height: 28)), for: .normal)
        }
        
        nextButton.do {
            $0.setImage(UIImage(resource: .icPlaynext), for: .normal)
        }
        
        songListButton.do {
            $0.setImage(UIImage(resource: .icPlaylist), for: .normal)
        }
    }
    
    private func setLayout() {
        songTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(11)
            $0.leading.equalToSuperview().inset(20)
            $0.height.equalTo(18)
        }
        
        songArtistLabel.snp.makeConstraints {
            $0.top.equalTo(songTitleLabel.snp.bottom).offset(3)
            $0.leading.equalToSuperview().inset(20)
        }
        
        playerButtonStackView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview().inset(15)
            $0.trailing.equalToSuperview().inset(20)
        }
    }
}
