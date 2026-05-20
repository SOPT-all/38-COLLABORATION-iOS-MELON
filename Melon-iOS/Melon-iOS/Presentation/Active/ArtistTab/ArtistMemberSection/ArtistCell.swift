//
//  ArtistCell.swift
//  Melon-iOS
//
//  Created by 초긍정행운의포춘쿠키 on 5/11/26.
//

import UIKit

import Kingfisher
import SnapKit
import Then

class ArtistCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    static let identifier = "ArtistCell"
    
    private let artistImage = UIImageView()
    
    private let artistLabel = UILabel()
    
    //MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        artistImage.kf.cancelDownloadTask()
        artistImage.image = nil
        artistLabel.text = nil
    }
    
    //MARK: - UI Setting
    
    private func setStyle() {
        artistImage.do {
            $0.backgroundColor = .appBlack
            $0.contentMode = .scaleAspectFill
            $0.layer.cornerRadius = 50
            $0.clipsToBounds = true
        }
        
        artistLabel.do {
            $0.font = .body_r_15
            $0.textColor = .appWhite
        }
    }
    
    private func setUI() {
        contentView.addSubviews(artistImage,artistLabel)
    }
    
    private func setLayout() {
        artistImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.size.equalTo(100)
        }
        
        artistLabel.snp.makeConstraints {
            $0.top.equalTo(artistImage.snp.bottom).offset(8)
            $0.leading.equalTo(artistImage.snp.leading).offset(10)
            $0.trailing.equalTo(artistImage.snp.trailing).inset(2)
            $0.bottom.equalToSuperview()
        }
    }
}

extension ArtistCell {
    func configure(_ artist: ArtistMember) {
        artistImage.kf.setImage(with: URL(string: artist.imageUrl))
        artistLabel.text = artist.name
    }
}
