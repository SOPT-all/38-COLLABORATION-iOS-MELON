//
//  PlaylistContainerView.swift
//  Melon-iOS
//
//  Created by 이상엽 on 5/13/26.
//

import UIKit

import SnapKit
import Then

final class PlaylistContainerView: BaseView {
    
    // MARK: - UI Components
    
    private let listViewTitleLabel = UILabel()
    
    private let firstSong = PlaylistCell()
    
    private let secondSong = PlaylistCell()
    
    // MARK: - Setup Methods
    
    override func setUI() {
        addSubviews(listViewTitleLabel, firstSong, secondSong)
    }
    
    override func setStyle() {
        backgroundColor = .gray600
        layer.cornerRadius = 20
        clipsToBounds = true
        
        listViewTitleLabel.do {
            $0.text = "재생 순서"
            $0.textColor = .appWhite
            $0.font = .body_r_15
        }
    }
    
    override func setLayout() {
        listViewTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.leading.equalToSuperview().inset(12)
        }
        
        firstSong.snp.makeConstraints {
            $0.top.equalTo(listViewTitleLabel.snp.bottom).offset(8)
            $0.horizontalEdges.equalToSuperview().inset(12)
        }
        
        secondSong.snp.makeConstraints {
            $0.top.equalTo(firstSong.snp.bottom).offset(4)
            $0.horizontalEdges.equalToSuperview().inset(12)
            $0.bottom.equalToSuperview().inset(14)
        }
    }
}
