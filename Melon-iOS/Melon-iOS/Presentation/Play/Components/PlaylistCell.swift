//
//  PlaylistCell.swift
//  Melon-iOS
//
//  Created by 이상엽 on 5/13/26.
//

import UIKit

import SnapKit
import Then

final class PlaylistCell: BaseView {
    private let albumImageView = UIImageView()
    
    private let titleLabel = UILabel()
    
    private let artistNameLabel = UILabel()
    
    private let playlistButton = UIButton()
    
    override func setUI() {
        addSubviews(albumImageView, titleLabel, artistNameLabel, playlistButton)
    }
    
    override func setStyle() {
        albumImageView.do {
            $0.image = .imgHomeMelonchart1
            $0.contentMode = .scaleAspectFit
        }
        
        titleLabel.do {
            $0.font = .body_r_15
            $0.textColor = .appWhite
            $0.text = "RUDE! (Silly Silky Remix)"
            $0.numberOfLines = 1
            $0.lineBreakMode = .byTruncatingTail
        }
        
        artistNameLabel.do {
            $0.font = .body_r_13
            $0.textColor = .gray300
            $0.text = "Hearts2Hearts (하츠투하츠), Silly Silk 어쩌구저쩌구 짤림"
            $0.numberOfLines = 1
            $0.lineBreakMode = .byTruncatingTail
        }
        
        playlistButton.do {
            $0.setImage(UIImage(resource: .icList), for: .normal)
        }
    }
    
    override func setLayout() {
        albumImageView.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview()
            $0.size.equalTo(44)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.lessThanOrEqualTo(albumImageView.snp.trailing).offset(8)
            $0.trailing.lessThanOrEqualTo(playlistButton.snp.leading).offset(-35)
        }
        
        artistNameLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(1)
            $0.leading.equalTo(albumImageView.snp.trailing).offset(8)
            $0.trailing.lessThanOrEqualTo(playlistButton.snp.leading).offset(-35)
        }
        
        playlistButton.snp.makeConstraints {
            $0.centerY.equalTo(albumImageView.snp.centerY)
            $0.trailing.equalToSuperview()
            $0.size.equalTo(24)
        }
    }
}
