//
//  EventCard.swift
//  Melon-iOS
//
//  Created by h2e on 5/13/26.
//

import UIKit

import SnapKit
import Then

final class EventCard: UICollectionViewCell {
    
    static let identifier: String = "EventCard"
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    
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
        contentView.addSubviews(imageView, titleLabel, subtitleLabel)
    }
    
    private func setLayout() {
        imageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.height.equalTo(141)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(10)
            $0.leading.equalToSuperview()
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.equalToSuperview()
        }
    }
    
    private func setStyle() {
        imageView.do {
            $0.layer.cornerRadius = 4
            $0.clipsToBounds = true
        }
        
        titleLabel.do {
            $0.font = .body_r_15
            $0.textColor = .appWhite
        }
        
        subtitleLabel.do {
            $0.font = .caption_r_12
            $0.textColor = .gray300
        }
    }
}

extension EventCard {
    func configure(with item: EventItem) {
        imageView.image = item.image
        titleLabel.text = item.title
        subtitleLabel.text = item.subtitle
    }
}
