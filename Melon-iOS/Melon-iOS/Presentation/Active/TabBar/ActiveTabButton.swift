//
//  ActiveTabButton.swift
//  Melon-iOS
//
//  Created by 성환 on 5/14/26.
//

import UIKit

import SnapKit
import Then

final class ActiveTabButton: UIButton {
    // MARK: - Properties
    
    override var isSelected: Bool {
        didSet {
            tabLabel.textColor = isSelected ? .green02 : .gray300
            bottomBorder.backgroundColor = isSelected ? .green02: .gray700
        }
    }

    // MARK: - UI Properties

    private let tabLabel = UILabel()
    private let bottomBorder = UIView()

    // MARK: - Initializer

    init(text: String) {
        super.init(frame: .zero)

        tabLabel.text = text
        setUI()
        setStyle()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI Settings

    private func setUI() {
        addSubviews(tabLabel, bottomBorder)
    }

    private func setStyle() {
        tabLabel.do {
            $0.font = .body_sb_15
        }
    }

    private func setLayout() {
        tabLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(14)
        }
        
        bottomBorder.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(2)
        }
    }
}
