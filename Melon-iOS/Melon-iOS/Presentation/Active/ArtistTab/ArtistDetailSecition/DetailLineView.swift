//
//  DetailLineView.swift
//  Melon-iOS
//
//  Created by 초긍정행운의포춘쿠키 on 5/15/26.
//

import UIKit

import SnapKit
import Then

final class DetailLineView: BaseView {
    
    // MARK: - Properties
    
    private let head : String
    
    private let body : String
    
    private let headLabel = UILabel()
    
    private let bodyLabel = UILabel()
    
    //MARK: - Initializer
    
    init(head: String, body: String) {
        self.head = head
        self.body = body
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: - UI Setting
    
    override func setStyle() {
        headLabel.do {
            $0.text = head
            $0.font = .body_r_14
            $0.textColor = .gray300
            $0.setContentCompressionResistancePriority(.required, for: .horizontal)
        }
        
        bodyLabel.do {
            $0.text = body
            $0.font = .body_r_14
            $0.textColor = .gray100
            $0.numberOfLines = 3
            $0.lineBreakMode = .byWordWrapping
            $0.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        }
    }
    
    override func setUI() {
        addSubviews(headLabel, bodyLabel)
    }
    
    override func setLayout() {
        headLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        bodyLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(78)
            $0.top.equalTo(headLabel.snp.top)
            $0.trailing.equalTo(headLabel.snp.leading).offset(332)
            $0.bottom.equalToSuperview()
        }
        
    }
}
