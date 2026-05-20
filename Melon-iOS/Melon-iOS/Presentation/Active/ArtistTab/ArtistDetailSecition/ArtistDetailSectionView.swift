//
//  ArtistDetailSectionView.swift
//  Melon-iOS
//
//  Created by 초긍정행운의포춘쿠키 on 5/16/26.
//

import UIKit

import SnapKit
import Then

final class ArtistDetailSectionView: BaseView {
    
    //MARK: - Properties
    
    private let detailHeader = ActiveViewSectionHeader(title: "상세정보")
    
    private let detailBodyStack = UIStackView()
    
    private let stack1Credit = DetailLineView(head: "크레딧", body: "발매곡22")
    
    private let stack2Debut = DetailLineView(head: "데뷔", body: "2025.02.24")
    
    private let stack3DebutSong = DebutSongView(albumArt: .imgActiveDetail, title: "The Chase", artist: "Hearts2Hearts(하츠투하츠)")
    
    private let stack4Type = DetailLineView(head: "유형", body: "대한민국/여성/그룹")
    
    private let stack5Agency = DetailLineView(head: "소속사", body: "(주) SM 엔터테인먼트")
    
    private let stack6Awards = DetailLineView(head: "수상 이력", body: "2025 한터뮤직 어워즈 올해의 루키상\n제 40회 골든 디스크 어워즈 골든디스크 업비트\n인기상...")
    
    private let stack7Intro = DetailLineView(head: "소개글", body: "Hearts2Hearts (하츠투하츠)는 지우(JIWOO), 카르멘 (CARMEN), 유하(YUHA...")
    
    //MARK: - UI Setting
    
    override func setStyle() {
        detailBodyStack.do {
            $0.axis = .vertical
            $0.alignment = .fill
            $0.distribution = .fill
            $0.spacing = 7
        }
    }
    
    override func setUI() {
        addSubviews(detailHeader, detailBodyStack)
        detailBodyStack.addArrangedSubviews(
            stack1Credit,
            stack2Debut,
            stack3DebutSong,
            stack4Type,
            stack5Agency,
            stack6Awards,
            stack7Intro)
    }
    
    override func setLayout() {
        detailHeader.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        detailBodyStack.snp.makeConstraints {
            $0.leading.equalTo(detailHeader.snp.leading).offset(21)
            $0.top.equalTo(detailHeader.snp.bottom).offset(20)
            $0.bottom.equalToSuperview()
        }
    }
    
    func configure(_ response: ArtistDetailResponseDTO) {
        stack1Credit.configure(body: response.credit)
        stack2Debut.configure(body: response.yearMonth)
        stack3DebutSong.configure(response.recentAlbums[0])
        stack4Type.configure(body: "\(response.country)/\(response.gender.displayText)/\(response.type.displayText)")
        stack5Agency.configure(body: response.agency)
        stack6Awards.configure(body: response.awardHistory.joined(separator: "\n"))
        stack7Intro.configure(body: response.description)
    }
}
