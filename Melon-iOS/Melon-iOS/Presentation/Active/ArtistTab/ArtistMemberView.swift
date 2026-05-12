//
//  ArtistMemberView.swift
//  Melon-iOS
//
//  Created by 초긍정행운의포춘쿠키 on 5/13/26.
//

import UIKit

import SnapKit
import Then

final class ArtistMemberView: BaseView {
    let artistHeader = ActiveViewSectionHeader(title: "아티스트")
    let artistBody = ArtistCollectionView()
    override func setUI() {
        addSubviews(artistHeader,artistBody)
    }
    
    override func setLayout() {
        artistHeader.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        artistBody.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(artistHeader.snp.bottom).offset(13)
            $0.bottom.equalToSuperview()
        }
    }
}
