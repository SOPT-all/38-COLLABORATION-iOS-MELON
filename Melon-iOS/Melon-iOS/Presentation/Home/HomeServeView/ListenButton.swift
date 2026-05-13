//
//  ListenButton.swift
//  Melon-iOS
//
//  Created by h2e on 5/13/26.
//

import UIKit

import SnapKit
import Then

final class ListenButton: UIButton {
    
    private let title: String
    
    private let listenTitlelabel = UILabel()
    private let listenIconView = UIImageView()
    
    private let listenButtonStackView = UIStackView()
    
    init(title: String) {
        self.title = title
        super.init(frame: .zero)
        
        setUI()
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        listenButtonStackView.addArrangedSubviews(listenIconView, listenTitlelabel)
        addSubviews(listenButtonStackView)
    }
    
    private func setLayout() {
        listenIconView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(11)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(103)
            $0.size.equalTo(22)
        }
        
        listenTitlelabel.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview().inset(11)
            $0.centerY.equalTo(listenIconView.snp.centerY)
            $0.leading.equalToSuperview().inset(131)
        }
        
        listenButtonStackView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.equalTo(22)
        }
    }

    private func setStyle() {
        listenIconView.do {
            $0.image = .icPlayFilled
            $0.tintColor = .appWhite
        }
        
        listenTitlelabel.do {
            $0.text = title
            $0.font = .body_r_15
            $0.textColor = .appWhite
        }
        
        listenButtonStackView.do {
            $0.axis = .horizontal
            $0.spacing = 6
            $0.alignment = .center
        }
    }
    
}
