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
    private let listenTitlelabel = UILabel()
    private let listenIconView = UIImageView()
    
    private let listenButtonStackView = UIStackView()
    
    private var normalBackgroundColor: UIColor = .gray600
    private var highlightedBackgroundColor: UIColor = .gray900
    
    init() {
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
        addSubview(listenButtonStackView)
    }
    
    private func setLayout() {
        listenIconView.snp.makeConstraints {
            $0.size.equalTo(22)
        }
        
        listenButtonStackView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }

    private func setStyle() {
        backgroundColor = normalBackgroundColor
        layer.cornerRadius = 4
        clipsToBounds = true
        
        listenIconView.do {
            $0.image = .icPlayFilled
            $0.tintColor = .appWhite
            $0.contentMode = .scaleAspectFit
        }
        
        listenTitlelabel.do {
            $0.text = "TOP100 전체 듣기"
            $0.font = .body_r_15
            $0.textColor = .appWhite
        }
        
        listenButtonStackView.do {
            $0.axis = .horizontal
            $0.spacing = 6
            $0.alignment = .center
            $0.isUserInteractionEnabled = false
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.15) {
                self.backgroundColor = self.isHighlighted ? self.highlightedBackgroundColor : self.normalBackgroundColor
            }
        }
    }
}
