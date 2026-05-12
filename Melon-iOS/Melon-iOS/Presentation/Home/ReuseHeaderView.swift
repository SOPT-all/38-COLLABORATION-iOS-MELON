//
//  ReuseHeaderView.swift
//  Melon-iOS
//
//  Created by h2e on 5/11/26.
//

import UIKit

import SnapKit
import Then

final class ReuseHeaderView: BaseView {
    private let subtitleLabel = UILabel()
    let titleLabel = UILabel()
    private let iconImageView = UIImageView()
    let seeAllButton = UIButton()
    
    init(subtitle: String, title: String, icon : UIImage) {
        super.init(frame: .zero)
        configure(subtitle: subtitle, title: title, icon: icon)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(subtitle: String, title: String, icon: UIImage) {
        subtitleLabel.text = subtitle
        titleLabel.text = title
        iconImageView.image = icon
    }
    
    override func setUI() {
        addSubviews(subtitleLabel, titleLabel, iconImageView, seeAllButton)
    }
    
    override func setLayout() {
        subtitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
        }
        
        iconImageView.snp.makeConstraints {
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(5)
            $0.leading.equalTo(titleLabel.snp.trailing).offset(6)
            $0.size.equalTo(20)
        }
        
        seeAllButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.centerY.equalTo(titleLabel)
        }
    }
    
    override func setStyle() {
        subtitleLabel.do {
            $0.font = .body_r_14
            $0.textColor = .appWhite
        }
        
        titleLabel.textColor = .appWhite
        
        seeAllButton.do {
            $0.setTitle("전체보기", for: .normal)
            $0.setTitleColor(.gray300, for: .normal)
            $0.titleLabel?.font = .body_r_14
            $0.addTarget(self, action: #selector(didTapSeeAll), for: .touchUpInside)
        }
    }
    
    @objc private func didTapSeeAll() {}

}
