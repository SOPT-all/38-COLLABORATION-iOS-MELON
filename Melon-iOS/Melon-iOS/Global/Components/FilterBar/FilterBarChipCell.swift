//
//  FilterBarChipCell.swift
//  Melon-iOS
//
//  Created by h2e on 5/11/26.
//

import UIKit

import SnapKit
import Then

final class FilterBarChipCell: UICollectionViewCell {
    
    static let identifier = "FilterBarChipCell"
    
    private enum Style {
        static let horizontalPadding: CGFloat = 20
        static let verticalPadding: CGFloat = 12
        static let cornerRadius: CGFloat = 19
        }
    
    private let label = UILabel().then {
        $0.font = .body_r_14
        $0.textColor = .appWhite
        $0.textAlignment = .center
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String, isSelected: Bool){
        label.text = title
        setStyle(isSelected: isSelected)
    }
    
    private func setUI() {
        contentView.addSubview(label)
    }
    
    private func setLayout() {
        label.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview().inset(Style.verticalPadding)
            $0.horizontalEdges.equalToSuperview().inset(Style.horizontalPadding)
        }
    }
    
    private func setStyle(isSelected: Bool) {
        contentView.do {
            $0.clipsToBounds = true
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = Style.cornerRadius
        }
        
        if isSelected {
            contentView.do {
                $0.backgroundColor = .green03
                $0.layer.borderColor = .none
            }
        } else {
            contentView.do {
                $0.backgroundColor = .none
                $0.layer.borderColor = UIColor.gray600.cgColor
            }
        }
    }
}
