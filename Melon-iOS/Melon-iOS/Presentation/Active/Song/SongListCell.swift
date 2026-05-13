//
//  SongListCell.swift
//  Melon-iOS
//
//  Created by 성환 on 5/12/26.
//

import UIKit

import SnapKit
import Then

final class SongListCell: UICollectionViewCell {
    // MARK: - Properties

    static let identifier = "SongListCell"
    
    // MARK: - UI Properties
    
    private let songImage = UIImageView()
    private let trackTitle = UILabel()
    private let artistName = UILabel()
    
    private let playButton = UIButton()
    private let moreButton = UIButton()
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setting
    
    private func setUI() {
        addSubviews(songImage, trackTitle, artistName, playButton, moreButton)
    }
    
    private func setStyle() {
        songImage.do {
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 4
        }
        
        trackTitle.do {
            $0.font = .body_r_15
            $0.textColor = .appWhite
            $0.lineBreakMode = .byTruncatingTail
        }
        
        artistName.do {
            $0.font = .body_r_13
            $0.textColor = .gray300
            $0.lineBreakMode = .byTruncatingTail
        }
        
        playButton.do {
            $0.setImage(.icPlayFilled, for: .normal)
        }
        
        moreButton.do {
            $0.setImage(.icMoreVertical2, for: .normal)
        }
    }
    
    private func setLayout() {
        songImage.snp.makeConstraints {
            $0.size.equalTo(44)
            $0.verticalEdges.leading.equalToSuperview()
        }
        
        trackTitle.snp.makeConstraints {
            $0.top.equalToSuperview().inset(4)
            $0.leading.equalTo(songImage.snp.trailing).offset(10)
            $0.width.equalTo(196)
        }
        
        artistName.snp.makeConstraints {
            $0.top.equalTo(trackTitle.snp.bottom)
            $0.leading.equalTo(trackTitle.snp.leading)
            $0.width.equalTo(196)
        }
        
        playButton.snp.makeConstraints {
            $0.size.equalTo(24)
            $0.leading.equalTo(trackTitle.snp.trailing).offset(17)
            $0.top.equalToSuperview().inset(10)
        }
        
        moreButton.snp.makeConstraints {
            $0.size.equalTo(24)
            $0.leading.equalTo(playButton.snp.trailing).offset(9)
            $0.top.equalTo(playButton)
        }
    }
}

extension SongListCell {
    func configure(_ songListData: SongListItemModel) {
        songImage.image = songListData.albumImageUrl
        trackTitle.text = songListData.title
        artistName.text = songListData.artist.name
    }
}
