//
//  myActivityList.swift
//  Melon-iOS
//
//  Created by 초긍정행운의포춘쿠키 on 5/13/26.
//
import UIKit

import SnapKit
import Then

final class MyActivityListView: BaseView {
    
    // MARK: - Properties
    
    private let iconView = UIView()
    
    private let iconImageView = UIImageView()
    
    private let titleLabel = UILabel()
    
    private let subLabel = UILabel()
    
    //MARK: - Initializer
    
    init(icon: UIImage,title: String,subtitle: String) {
        super.init(frame: .zero)

        iconImageView.image = icon
        titleLabel.text = title
        subLabel.text = subtitle
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: - UI Setting
    
    override func setStyle() {
        iconView.do {
            $0.backgroundColor = .gray700
            $0.layer.cornerRadius = 4
            $0.clipsToBounds = true
        }
        
        titleLabel.do {
            $0.font = .body_r_15
            $0.textColor = .appWhite
        }
        
        subLabel.do {
            $0.font = .body_r_13
            $0.textColor = .gray300
        }
    }
    
    override func setUI() {
        addSubviews(iconView,iconImageView,titleLabel,subLabel)
    }
    
    override func setLayout() {
        iconView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.size.equalTo(44)
        }
        
        iconImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(10)
            $0.centerY.equalTo(iconView.snp.centerY)
            $0.size.equalTo(24)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(2.5)
            $0.leading.equalTo(iconView.snp.trailing).offset(10)
            $0.trailing.equalToSuperview()
        }
        
        subLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(2.5)
            $0.leading.equalTo(iconView.snp.trailing).offset(10)
        }
    }
}
