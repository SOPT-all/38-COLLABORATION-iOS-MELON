//
//  AlbumListCell.swift
//  Melon-iOS
//
//  Created by 성환 on 5/13/26.
//

import UIKit

import SnapKit
import Then

final class AlbumListCell: UICollectionViewCell {
    // MARK: - Properties

    static let identifier = "AlbumListCell"
    
    // MARK: - UI Properties
    
    private let albumCoverImageView = UIImageView()
    private let albumNameLabel = UILabel()
    private let artistNameLabel = UILabel()
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Settings
    
    private func setStyle() {
        albumCoverImageView.do {
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 4
        }
        
        albumNameLabel.do {
            $0.textColor = .appWhite
            $0.font = .body_r_15
            $0.numberOfLines = 2
            $0.lineBreakMode = .byTruncatingTail
        }
        
        artistNameLabel.do {
            $0.textColor = .gray300
            $0.font = .body_r_13
            $0.lineBreakMode = .byTruncatingTail
        }
    }
    
    private func setUI() {
        addSubviews(albumCoverImageView, albumNameLabel, artistNameLabel)
    }
    
    private func setLayout() {
        albumCoverImageView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.size.equalTo(152)
        }
        
        albumNameLabel.snp.makeConstraints {
            $0.top.equalTo(albumCoverImageView.snp.bottom).offset(8)
            $0.horizontalEdges.equalToSuperview()
        }
        
        artistNameLabel.snp.makeConstraints {
            $0.top.equalTo(albumNameLabel.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
        }
    }
}

extension AlbumListCell {
    func configure(_ albumListData: AlbumListModel) {
        albumCoverImageView.image = albumListData.imageUrl
        albumNameLabel.text = albumListData.title
        artistNameLabel.text = albumListData.artistName
    }
}
