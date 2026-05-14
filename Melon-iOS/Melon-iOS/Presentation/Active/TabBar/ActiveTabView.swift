//
//  ActiveTabView.swift
//  Melon-iOS
//
//  Created by 성환 on 5/14/26.
//

import UIKit

import SnapKit
import Then

final class ActiveTabView: UIView {
    // MARK: - Properties

    private var buttons: [ActiveTabButton] = []

    // MARK: - UI Properties

    private let buttonStackView = UIStackView()

    // MARK: - Initializer

    init(titles: [String]) {
        super.init(frame: .zero)

        makeButtons(titles: titles)
        setUI()
        setStyle()
        setLayout()
        select(index: 0)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI Settings

    private func setUI() {
        buttons.forEach { buttonStackView.addArrangedSubview($0) }
        addSubview(buttonStackView)
    }

    private func setStyle() {
        buttonStackView.do {
            $0.axis = .horizontal
            $0.distribution = .fillEqually
        }
    }

    private func setLayout() {
        buttonStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Functions
    
    private func makeButtons(titles: [String]) {
        buttons = titles.enumerated().map { index, title in
            let button = ActiveTabButton(text: title)
            button.tag = index
            button.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
            return button
        }
    }

    private func select(index: Int) {
        guard buttons.indices.contains(index) else { return }

        buttons.forEach { $0.isSelected = false }
        buttons[index].isSelected = true
    }

    @objc
    private func buttonDidTap(_ sender: ActiveTabButton) {
        select(index: sender.tag)
    }
}
