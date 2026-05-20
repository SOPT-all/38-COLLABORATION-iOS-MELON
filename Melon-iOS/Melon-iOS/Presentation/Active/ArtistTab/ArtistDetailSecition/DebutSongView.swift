//
//  DebutSongView.swift
//  Melon-iOS
//
//  Created by 초긍정행운의포춘쿠키 on 5/16/26.
//

import UIKit
import Kingfisher

import SnapKit
import Then

final class DebutSongView: BaseView {
    
    // MARK: - Properties
    
    private let albumArt : UIImage
    
    private let title : String
    
    private let artist : String
    
    private let headLabel = UILabel()
    
    private let imageView = UIImageView()
    
    private let playIcon = UIImageView()
    
    private let titleLabel = UILabel()
    
    private let artistLabel = UILabel()
    
    //MARK: - Initializer
    
    init(albumArt: UIImage, title: String, artist: String) {
        self.albumArt = albumArt
        self.title = title
        self.artist = artist
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: - UI Setting
    
    override func setStyle() {
        headLabel.do {
            $0.text = "데뷔곡"
            $0.font = .body_r_14
            $0.textColor = .gray300
        }
        
        imageView.do {
            $0.image = albumArt
            $0.layer.cornerRadius = 4
            $0.clipsToBounds = true
        }
        
        playIcon.do {
            $0.image = .icPlayFilled
        }
        titleLabel.do {
            $0.text = title
            $0.font = .body_r_13
            $0.textColor = .appWhite
        }
        
        artistLabel.do {
            $0.text = artist
            $0.font = .body_r_13
            $0.textColor = .gray300
        }
    }
    
    override func setUI() {
        addSubviews(headLabel, imageView, playIcon, titleLabel, artistLabel)
    }
    
    override func setLayout() {
        headLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(78)
            $0.top.equalTo(headLabel.snp.top).offset(2)
            $0.size.equalTo(43)
            $0.bottom.equalToSuperview()
        }
        
        playIcon.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.leading).offset(10)
            $0.top.equalTo(imageView.snp.top).offset(9)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.trailing).offset(10)
            $0.bottom.equalTo(imageView.snp.centerY).offset(1)
        }
        
        artistLabel.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.trailing).offset(10)
            $0.top.equalTo(imageView.snp.centerY).offset(2)
        }
    }
    
    func configure(_ album: RecentAlbumDTO) {
        imageView.kf.setImage(with: URL(string: album.imageUrl))
        titleLabel.text = album.title
        artistLabel.text = album.artistName
    }
}
