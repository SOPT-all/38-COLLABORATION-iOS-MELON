//
//  MyActivitySectionView.swift
//  Melon-iOS
//
//  Created by 초긍정행운의포춘쿠키 on 5/13/26.
//

import UIKit

import SnapKit
import Then

final class MyActivitySectionView: BaseView {
    
    //MARK: - Properties
    
    private let myActivityHeader = ActiveViewSectionHeader(title: "내 활동")
    
    private let myCardInfoView = UIView()
    
    private let myCardInfoLabel = UILabel()
    
    private let myCardChevron = UIImageView()
    
    private let myCardCollectionView = CardCollectionView()
    
    private let likeList = MyActivityListView(icon: .icBigheart.withTintColor(.gray200),title: "좋아한 곡", subtitle: "17곡")
    private let commentList = MyActivityListView(icon: .icChat.withTintColor(.gray200),title: "내가 작성한 댓글", subtitle: "23개")
    
   //MARK: - Private Methods
    
    private func setInfoLabel() {
        let name = "김렛솝"
        let text = "\(name)님은 3개의 카드를 가지고 있어요."
        let coloredText = NSMutableAttributedString(string: text)
        let range = (text as NSString).range(of: name)
        coloredText.addAttribute(.foregroundColor, value: UIColor.green02, range: range)
        myCardInfoLabel.attributedText = coloredText
    }
    
    //MARK: - UI Setting
    
    override func setStyle() {
        
        myCardInfoView.do{
            $0.backgroundColor = .gray800
            $0.layer.cornerRadius = 4
            $0.clipsToBounds = true
        }
        
        myCardInfoLabel.do{
            $0.font = .body_r_15
            $0.textColor = .gray100
        }
        
        myCardChevron.do {
            $0.image = .icChevronRightS.withTintColor(.gray400)
        }
        
        setInfoLabel()
    }
    
    override func setUI() {
        addSubviews(myActivityHeader,
                    myCardInfoView,
                    myCardCollectionView,
                    likeList,
                    commentList)
        
        myCardInfoView.addSubviews(myCardInfoLabel,myCardChevron)
    }
    
    override func setLayout() {
        myActivityHeader.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        myCardInfoView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.top.equalTo(myActivityHeader.snp.bottom).offset(10)
            $0.height.equalTo(58)
        }
        
        myCardInfoLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
        }
        
        myCardChevron.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(11)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(24)
        }
        
        myCardCollectionView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalTo(myCardInfoView.snp.bottom).offset(19)
            $0.width.equalTo(470)
            $0.height.equalTo(150)
            
        }
        
        likeList.snp.makeConstraints{
            $0.top.equalTo(myCardCollectionView.snp.bottom).offset(21)
            $0.leading.equalTo(myCardInfoView.snp.leading)
            $0.height.equalTo(44)
        }
        
        commentList.snp.makeConstraints{
            $0.top.equalTo(likeList.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
        }
    }
}
