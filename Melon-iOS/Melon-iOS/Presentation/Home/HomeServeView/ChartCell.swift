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
    
    private let songImageView = UIImageView()
    private let rankLabel = UILabel()
    private let songTitleLabel = UILabel()
    private let rankChangeLabel = UILabel()
    private let singerLabel = UILabel()
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
    
    func configure(image: UIImage, rank: Int, title: String, rankChange: String, singer: String){
        songImageView.image = image
        rankLabel.text = "\(rank)"
        songTitleLabel.text = title
        rankChangeLabel.text = rankChange
        singerLabel.text = singer
    }
    
    private func setUI() {
        contentView.addSubviews(songImageView, rankLabel, songTitleLabel, rankChangeLabel, singerLabel, playButton)
    }
    
    private func setLayout() {
        songImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(40)
        }
        
        rankLabel.snp.makeConstraints {
            $0.leading.equalTo(songImageView.snp.trailing).offset(19)
            $0.top.equalToSuperview().inset(16.5)
        }
        
        songTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(rankLabel.snp.trailing).offset(19)
            $0.top.equalToSuperview().inset(14)
        }
        
        rankChangeLabel.snp.makeConstraints {
            $0.top.equalTo(rankLabel.snp.bottom).offset(8)
            $0.leading.equalTo(songImageView.snp.trailing).offset(19)
        }
        
        singerLabel.snp.makeConstraints {
            $0.leading.equalTo(rankLabel.snp.trailing).offset(19)
            $0.top.equalTo(songTitleLabel.snp.bottom)
        }
        
        playButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.size.equalTo(22)
        }
    }
    
    private func setStyle() {
        songImageView.do {
            $0.layer.cornerRadius = 4
        }
        
        rankLabel.do {
            $0.font = .body_r_15
            $0.textColor = .appWhite
        }
        
        songTitleLabel.do {
            $0.font = .body_r_15
            $0.textColor = .appWhite
        }
        
        rankChangeLabel.do {
            $0.font = .body_r_15
            $0.textColor = .appWhite
        }
        
        singerLabel.do {
            $0.font = .body_r_13
            $0.textColor = .gray300
        }
        
        playButton.do {
            $0.setImage(.icPlayFilled, for: .normal)
            $0.tintColor = .appWhite
        }
    }
}
