//
//  ActiveTopNavigateBar.swift
//  Melon-iOS
//
//  Created by 성환 on 5/11/26.
//

import UIKit

import SnapKit
import Then

final class ActiveTopNavigateBar: BaseView {
    // MARK: - UI Properties
    
    private let previousButton = UIButton()
    private let morebutton = UIButton()
    
    // MARK: - UI Setting
    
    override func setUI() {
        addSubviews(previousButton, morebutton)
    }
    
    override func setStyle() {
        previousButton.do {
            $0.setImage(.icChevronLeft, for: .normal)
        }
        
        morebutton.do {
            $0.setImage(.icMoreVertical1, for: .normal)
        }
    }
    
    override func setLayout() {
        previousButton.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.size.equalTo(44)
        }
        
        morebutton.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.size.equalTo(44)
        }
    }
}
