//
//  ChartCell.swift
//  Melon-iOS
//
//  Created by h2e on 5/12/26.
//

import UIKit

import SnapKit
import Then

final class ChartCell: UICollectionViewCell {
    
    static let identifier: String = "ChartCell"
    
    private let albumImageView = UIImageView()
    private let rankLabel = UILabel()
    private let titleLabel = UILabel()
    private let rankChangeLabel = UILabel()
    private let artistLabel = UILabel()
    private let playButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private func setUI() {
        contentView.addSubviews(
            albumImageView, rankLabel, titleLabel,
            rankChangeLabel, artistLabel, playButton
        )
    }
    
    private func setLayout() {
        albumImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(40)
        }
        
        rankLabel.snp.makeConstraints {
            $0.leading.equalTo(albumImageView.snp.trailing).offset(19)
            $0.top.equalToSuperview().inset(16.5)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(rankLabel.snp.trailing).offset(19)
            $0.top.equalToSuperview().inset(14)
        }
        
        rankChangeLabel.snp.makeConstraints {
            $0.top.equalTo(rankLabel.snp.bottom).offset(8)
            $0.leading.equalTo(albumImageView.snp.trailing).offset(19)
        }
        
        artistLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.top.equalTo(titleLabel.snp.bottom)
        }
        
        playButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.size.equalTo(22)
        }
    }
    
    private func setStyle() {
        albumImageView.do {
            $0.layer.cornerRadius = 4
            $0.clipsToBounds = true
            $0.contentMode = .scaleAspectFill
        }
        
        rankLabel.do {
            $0.font = .body_r_15
            $0.textColor = .appWhite
        }
        
        titleLabel.do {
            $0.font = .body_r_15
            $0.textColor = .appWhite
        }
        
        rankChangeLabel.do {
            $0.font = .body_r_15
            $0.textColor = .appWhite
        }
        
        artistLabel.do {
            $0.font = .body_r_13
            $0.textColor = .gray300
        }
        
        playButton.do {
            $0.setImage(.icPlayFilled, for: .normal)
            $0.tintColor = .appWhite
        }
    }
}

extension ChartCell {
    func configure(with song: ChartSong) {
            albumImageView.image = song.albumImageUrl
            rankLabel.text = "\(song.songId)"
            titleLabel.text = song.title
            rankChangeLabel.text = "-"
            artistLabel.text = song.artistName
        }
}
