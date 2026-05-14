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
            setNeedsLayout()
        }
    }

    // MARK: - UI Properties

    private let tabLabel = UILabel()

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

    // MARK: - Lift Cycle

    override func layoutSubviews() {
        super.layoutSubviews()

        layer.removeBorder(position: .bottom)
        layer.addBorder(position: .bottom, color: isSelected ? .green02 : .gray700, width: 2)
    }

    // MARK: - UI Settings

    private func setUI() {
        addSubviews(tabLabel)
    }

    private func setStyle() {
        tabLabel.do {
            $0.font = .body_sb_15
            $0.textColor = .gray300
        }
    }

    private func setLayout() {
        tabLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(14)
        }
    }
}
