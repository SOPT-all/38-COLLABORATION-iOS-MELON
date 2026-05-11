//
//  ArtistCell.swift
//  Melon-iOS
//
//  Created by 초긍정행운의포춘쿠키 on 5/11/26.
//

import UIKit

import SnapKit
import Then

class ArtistCell: UICollectionViewCell {
    static let identifier = "ArtistCell"
    
    private let artistImage = UIImageView()
    
    private let artistLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        artistImage.do {
            $0.image = .imgActiveArtistH2Hjiwoo
            $0.contentMode = .scaleAspectFill
            $0.layer.cornerRadius = 50
            $0.clipsToBounds = true
        }
        artistLabel.do {
            $0.text = "지우 (JIWOO)"
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
            $0.width.height.equalTo(100)
        }
        artistLabel.snp.makeConstraints {
            $0.top.equalTo(artistImage.snp.bottom).offset(8)
            $0.leading.equalTo(artistImage.snp.leading).offset(5)
            $0.trailing.equalTo(artistImage.snp.trailing).inset(2)
        }
    }
}

extension ArtistCell {
    func dataBind(_ imageData: ImageModel) {
        artistImage.image = imageData.artistPicture
        artistLabel.text = imageData.artistName
    }
}
