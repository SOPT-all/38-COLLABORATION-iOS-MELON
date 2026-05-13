//
//  RecommendationCard.swift
//  Melon-iOS
//
//  Created by h2e on 5/12/26.
//

import UIKit

import SnapKit
import Then

final class RecommendationCard: BaseView {
    
    enum Style {
        case large
        case small
            
        var titleFont: UIFont {
            switch self {
            case .large: return .body_r_15
            case .small: return .caption_r_12
            }
        }
            
        var hashtagFont: UIFont {
            switch self {
            case .large: return .caption_r_12
            case .small: return .caption_r_10
            }
        }
            
        var contentLeadingInset: CGFloat {
            switch self {
            case .large: return 8
            case .small: return 4
            }
        }
        
        var contentTopInset: CGFloat {
            switch self {
            case .large: return 93
            case .small: return 18
            }
        }
        
        var contentPadding: CGFloat {
            switch self {
            case .large: return 4
            case .small: return 2
            }
        }
        
        var titleSize: CGFloat {
            switch self {
            case .large: return 18
            case .small: return 19
            }
        }
    }
    
    private let style: Style
    
    private let imageView = UIImageView()
    let tagChipView = UIView()
    private let tagLabel = UILabel()
    let playIconButton = UIButton()
    let titleLabel = UILabel()
    let hashtagLabel = UILabel()
    
    init(style: Style, image: UIImage, tag: String, title: String, hashtag: String) {
        self.style = style
        super.init(frame: .zero)
        configure(image: image, tag: tag, title: title, hashtag: hashtag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setUI() {
        tagChipView.addSubview(tagLabel)
        addSubviews(imageView, tagChipView, playIconButton, titleLabel, hashtagLabel)
    }
    
    override func setLayout() {
        let leadingInset = style.contentLeadingInset
        let padding = style.contentPadding
        let topInset = style.contentTopInset
        let titleSize = style.titleSize
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        tagChipView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(leadingInset)
            $0.top.equalToSuperview().inset(topInset)
            $0.height.equalTo(16)
        }
        
        tagLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(8)
            $0.verticalEdges.equalTo(tagChipView)
        }
        
        playIconButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(6)
            $0.trailing.equalTo(imageView.snp.trailing).offset(-8)
            $0.size.equalTo(28)
        }
        
        titleLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(leadingInset)
            $0.top.equalTo(tagChipView.snp.bottom).offset(padding)
            $0.height.equalTo(titleSize)
        }
        
        hashtagLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(leadingInset)
            $0.top.equalTo(titleLabel.snp.bottom).offset(padding)
        }
        
    }
    
    override func setStyle() {
        self.do {
            $0.layer.cornerRadius = 4
            $0.clipsToBounds = true
        }
        
        imageView.do {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
        
        tagChipView.do {
            $0.backgroundColor = .clear
            $0.layer.cornerRadius = 8
            $0.layer.borderColor = UIColor.green03.cgColor
            $0.layer.borderWidth = 0.61
        }
        
        tagLabel.do {
            $0.textColor = .appWhite
            $0.font = .caption_r_10
        }
        
        titleLabel.do {
            $0.textColor = .appWhite
            $0.font = style.titleFont
            $0.numberOfLines = 1
            $0.lineBreakMode = .byTruncatingTail
        }
        
        playIconButton.do {
            $0.setImage(.imgMixup, for: .normal)
            $0.contentMode = .scaleAspectFit
        }
        
        hashtagLabel.do {
            $0.textColor = .gray300
            $0.font = style.hashtagFont
            $0.numberOfLines = 1
            $0.lineBreakMode = .byTruncatingTail
        }
    }
    
    func configure(image: UIImage, tag: String, title: String, hashtag: String) {
        imageView.image = image
        tagLabel.text = tag
        titleLabel.text = title
        hashtagLabel.text = hashtag
    }
}
