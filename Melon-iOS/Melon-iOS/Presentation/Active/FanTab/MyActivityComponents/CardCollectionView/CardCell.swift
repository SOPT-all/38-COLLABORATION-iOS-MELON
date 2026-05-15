//
//  CardCell.swift
//  Melon-iOS
//
//  Created by 초긍정행운의포춘쿠키 on 5/13/26.
//

import UIKit

import SnapKit
import Then

class CardCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    static let identifier = "CardCell"
    
    private let cardImage = UIImageView()
    
    private let cardLabel = UILabel()
    
    private let cardSong = UILabel()
    
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
    
    //MARK: - UI Setting
    
    private func setStyle() {
        cardImage.do {
            $0.image = .imgActiveFeaturedtrackcard1
            $0.contentMode = .scaleAspectFill
            $0.layer.cornerRadius = 4
            $0.clipsToBounds = true
        }
        
        cardLabel.do {
            $0.text = "처음 좋아요한 곡"
            $0.font = .body_r_13
            $0.textColor = .appWhite
        }
        cardSong.do{
            $0.text = "FOCUS"
            $0.font = .body_sb_15
            $0.textColor = .appWhite
        }
    }
    
    private func setUI() {
        contentView.addSubviews(cardImage,cardLabel,cardSong)
        backgroundColor = .clear
        contentView.backgroundColor = .clear
    }
    
    private func setLayout() {
        cardImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.size.equalTo(150)
        }
        
        cardLabel.snp.makeConstraints {
            $0.top.equalTo(cardImage.snp.top).offset(17)
            $0.leading.equalTo(cardImage.snp.leading).offset(20)
        }
        
        cardSong.snp.makeConstraints {
            $0.top.equalTo(cardImage.snp.top).offset(38)
            $0.leading.equalTo(cardImage.snp.leading).offset(20)
        }
    }
}

extension CardCell {
    func configure(_ data: CardModel) {
        cardImage.image = data.card
        cardLabel.text = data.cardText
        cardSong.text = data.cardTitle
    }
}
