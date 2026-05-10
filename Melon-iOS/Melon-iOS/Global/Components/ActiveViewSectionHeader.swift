//
//  ActiveViewSectionHeader.swift
//  Melon-iOS
//
//  Created by 초긍정행운의포춘쿠키 on 5/11/26.
//

import UIKit

import SnapKit
import Then

final class ActiveViewSectionHeader: BaseView {
    
    // MARK: - Properties
    
    private let title: String
    private let iconImage: UIImage?
    
    // MARK: - Components
    
    private lazy var headerLabel = UILabel().then {
        $0.text = title
        $0.font = .title_b_20
        $0.textColor = .appWhite
    }
    
    private lazy var iconImageView = UIImageView().then {
        $0.image = iconImage
        $0.isHidden = (iconImage == nil)
    }
    
    private let captionLabel = UILabel().then {
        $0.text = "전체보기"
        $0.font = .body_r_15
        $0.textColor = .gray300
    }
    
    // MARK: - Init
    
    init(title: String,iconImage: UIImage? = nil) {
        self.title = title
        self.iconImage = iconImage
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetUI
    
    override func setUI() {
    addSubviews(headerLabel,iconImageView,captionLabel)
    }
    
    // MARK: - SetLayout
    
    override func setLayout() {
        
        headerLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
        }
        
        iconImageView.snp.makeConstraints {
            $0.leading.equalTo(headerLabel.snp.trailing).offset(6)
            $0.centerY.equalTo(headerLabel.snp.centerY)
            $0.size.equalTo(20)
        }
        
        captionLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.centerY.equalTo(headerLabel.snp.centerY)
        }
    }
} //end
