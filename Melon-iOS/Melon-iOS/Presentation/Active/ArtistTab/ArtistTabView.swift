//
//  ArtistTabView.swift
//  Melon-iOS
//
//  Created by 초긍정행운의포춘쿠키 on 5/16/26.
//

import UIKit

import SnapKit
import Then

final class ArtistTabView: BaseView {
    
    //MARK: - Properties
    
    private let contentStackView = UIStackView()
    
    private let artistMemberSection = ArtistMemberSectionView()
    
    private let artistDetailSection = ArtistDetailSectionView()
    
    //MARK: - UI Setting
    
    override func setStyle() {
        contentStackView.do {
            $0.axis = .vertical
            $0.alignment = .fill
            $0.distribution = .fill
            $0.spacing = 46
        }
    }
    
    override func setUI() {
        backgroundColor = .appBlack
        addSubview(contentStackView)
        contentStackView.addArrangedSubviews(artistMemberSection, artistDetailSection)
    }
    
    override func setLayout() {
        contentStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.bottom.equalToSuperview().inset(70)
        }
    }
    
    func configure(_ response: ArtistDetailResponseDTO) {
        artistMemberSection.configure(response.artists)
        artistDetailSection.configure(response)
    }
}
