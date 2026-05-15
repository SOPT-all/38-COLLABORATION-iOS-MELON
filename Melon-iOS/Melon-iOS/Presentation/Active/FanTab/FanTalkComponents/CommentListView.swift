//
//  MyActivityListView.swift
//  Melon-iOS
//
//  Created by 초긍정행운의포춘쿠키 on 5/15/26.
//

import UIKit

import SnapKit
import Then

final class CommentListView: BaseView {
    
    // MARK: - Properties
    
    private let name = UILabel()
    
    private let temperature = UILabel()
    
    private let context = UILabel()

    //MARK: - Initializer
    
    init() {
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: - UI Setting
    
    override func setStyle() {
        name.do {
            $0.text = "하츠투하츄"
            $0.font = .caption_r_12
            $0.textColor = .gray100
        }
        
        temperature.do {
            $0.text = "99°"
            $0.font = .caption_r_12
            $0.textColor = .appRed
        }
        
        context.do {
            $0.text = "🩵🩵🩵"
            $0.font = UIFont.systemFont(ofSize: 14)
            $0.textColor = .appWhite
            }
        }
    
    override func setUI() {
        addSubviews(name,temperature,context)
    }
    
    override func setLayout() {
        name.snp.makeConstraints {
            $0.top.equalToSuperview().inset(2)
            $0.leading.equalToSuperview()
        }
        
        temperature.snp.makeConstraints {
            $0.leading.equalTo(name.snp.trailing).offset(2)
            $0.top.equalToSuperview().inset(2)
        }
        
        context.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.leading.equalTo(temperature.snp.trailing).offset(7)
            $0.trailing.equalToSuperview()
        }
    }
}
