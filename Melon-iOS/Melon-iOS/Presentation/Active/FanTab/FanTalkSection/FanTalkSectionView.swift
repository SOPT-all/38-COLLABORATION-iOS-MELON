//
//  FanTalkSectionView.swift
//  Melon-iOS
//
//  Created by 초긍정행운의포춘쿠키 on 5/15/26.
//


import UIKit

import SnapKit
import Then

final class FanTalkSectionView : BaseView {
    
    //MARK: - Properties
    
    private let fanTalkHeader = ActiveViewSectionHeader(title: "팬톡 인기 포스트", iconImage: .iconBrand3Green)
    
    private let fanTalkPostView = UIImageView()
    
    private let fanTalkPostLabel = UILabel()
    
    private let fanTalkPlusView = UIView()
    
    private let fanTalkPlusLabel = UILabel()
    
    private let fanTalkHeart = UIImageView()
    
    private  let fanTalkHeartLabel = UILabel()
    
    private let fanTalkComment = UIImageView()
    
    private let fanTalkCommentLabel = UILabel()
    
    private let commentStackView = UIStackView()
    
    private let comment1 = CommentListView()
    private let comment2 = CommentListView()
    
    private let commentLabel = UILabel()
    
    
    //MARK: - UI Setting
    
    override func setStyle() {
        fanTalkPostView.do {
            $0.image = .imgActiveFeaturedpostcard
            $0.layer.cornerRadius = 4
            $0.clipsToBounds = true
        }
        
        fanTalkPostLabel.do {
            $0.text = "[Hi-RiSiNG] Hearts2Hearts 컨셉 포토\n독점 선공개!"
            $0.numberOfLines = 2
            $0.font = .body_sb_18
            $0.textColor = .appWhite
        }
        
        fanTalkPlusView.do {
            $0.layer.cornerRadius = 12
            $0.backgroundColor = .gray800.withAlphaComponent(0.5)
        }
        
        fanTalkPlusLabel.do {
            $0.text = "+8"
            $0.font = .body_r_14
            $0.textColor = .appWhite
        }
        
        fanTalkHeart.do {
            $0.image = .icStarHeart.withTintColor(.gray100)
        }
        
        fanTalkHeartLabel.do {
            $0.text = "839"
            $0.font = .body_r_14
            $0.textColor = .gray100
        }
        
        fanTalkComment.do {
            $0.image = .icChat.withTintColor(.gray100)
        }
        
        fanTalkCommentLabel.do {
            $0.text = "89"
            $0.font = .body_r_14
            $0.textColor = .gray100
        }
        
        commentStackView.do {
            $0.axis = .vertical
            $0.spacing = 6
        }
        
        commentLabel.do {
            $0.text = "댓글 89개 모두 보기"
            $0.font = .body_r_13
            $0.textColor = .gray300
        }
    }
    
    override func setUI(){
        addSubviews(fanTalkHeader,
                    fanTalkPostView,
                    fanTalkPostLabel,
                    fanTalkPlusView,
                    fanTalkPlusLabel,
                    fanTalkHeart,
                    fanTalkHeartLabel,
                    fanTalkComment,
                    fanTalkCommentLabel,
                    commentStackView,
                    commentLabel)
        
        commentStackView.addArrangedSubviews(comment1,comment2)
    }
    
    override func setLayout() {
        fanTalkHeader.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        fanTalkPostView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.top.equalTo(fanTalkHeader.snp.bottom).offset(12)
            $0.height.equalTo(335)
        }
        
        fanTalkPostLabel.snp.makeConstraints {
            $0.top.equalTo(fanTalkPostView.snp.top).offset(272)
            $0.leading.equalTo(fanTalkPostView.snp.leading).offset(16)
        }
        
        fanTalkPlusView.snp.makeConstraints {
            $0.top.equalTo(fanTalkPostView.snp.top).offset(12)
            $0.leading.equalTo(fanTalkPostView.snp.leading).offset(291)
            $0.width.equalTo(32)
            $0.height.equalTo(24)
        }
        
        fanTalkPlusLabel.snp.makeConstraints {
            $0.top.equalTo(fanTalkPostView.snp.top).offset(14)
            $0.leading.equalTo(fanTalkPostView.snp.leading).offset(298)
            $0.width.equalTo(17)
            $0.height.equalTo(21)
        }
        
        fanTalkHeart.snp.makeConstraints {
            $0.top.equalTo(fanTalkPostView.snp.bottom).offset(11)
            $0.leading.equalTo(fanTalkPostView.snp.leading)
        }
        
        fanTalkHeartLabel.snp.makeConstraints {
            $0.centerY.equalTo(fanTalkHeart.snp.centerY)
            $0.leading.equalTo(fanTalkHeart.snp.trailing).offset(5)
        }
        
        fanTalkComment.snp.makeConstraints {
            $0.top.equalTo(fanTalkPostView.snp.bottom).offset(11)
            $0.leading.equalTo(fanTalkHeartLabel.snp.trailing).offset(11)
        }
        
        fanTalkCommentLabel.snp.makeConstraints {
            $0.centerY.equalTo(fanTalkComment.snp.centerY)
            $0.leading.equalTo(fanTalkComment.snp.trailing).offset(4)
        }
        
        commentStackView.snp.makeConstraints {
            $0.top.equalTo(fanTalkPostView.snp.bottom).offset(42)
            $0.leading.equalTo(fanTalkPostView.snp.leading)
        }
        
        commentLabel.snp.makeConstraints {
            $0.top.equalTo(fanTalkPostView.snp.bottom).offset(93)
            $0.leading.equalTo(fanTalkPostView.snp.leading)
            $0.bottom.equalToSuperview()
        }
    }
}
