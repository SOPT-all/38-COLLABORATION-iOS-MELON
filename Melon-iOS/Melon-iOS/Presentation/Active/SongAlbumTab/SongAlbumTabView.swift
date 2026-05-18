//
//  SongAlbumTabView.swift
//  Melon-iOS
//
//  Created by 성환 on 5/15/26.
//

import UIKit

import SnapKit
import Then

final class SongAlbumTabView: BaseView {
    // MARK: - Properties
    
    private static let songFilterList: KeyValuePairs<String, String> = ["1": "인기순", "2": "최신순", "3": "다운로드순", "4": "플레이리스트"]
    
    // MARK: - UI Properties
    
    private let songSectionHeader = ActiveViewSectionHeader(title: "곡")
    private let songFilterBarView = FilterBarView(items: songFilterList, selectedID: "1")
    private let songCollectionView = SongListView()
    
    private let albumSectionHeader = ActiveViewSectionHeader(title: "최신 앨범")
    private let albumCollectionView = AlbumListView()
    
    // MARK: - UI Settings
    
    override func setUI() {
        addSubviews(
            songSectionHeader,
            songFilterBarView,
            songCollectionView,
            albumSectionHeader,
            albumCollectionView
        )
    }
    
    override func setLayout() {
        songSectionHeader.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
        }
        
        songFilterBarView.snp.makeConstraints {
            $0.top.equalTo(songSectionHeader.snp.bottom).offset(21)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(52)
        }
        
        songCollectionView.snp.makeConstraints {
            $0.top.equalTo(songFilterBarView.snp.bottom).offset(21)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(284)
        }
        
        albumSectionHeader.snp.makeConstraints {
            $0.top.equalTo(songCollectionView.snp.bottom).offset(46)
            $0.horizontalEdges.equalToSuperview()
        }
        
        albumCollectionView.snp.makeConstraints {
            $0.top.equalTo(albumSectionHeader.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(220)
            $0.bottom.equalToSuperview()
        }
    }
    
}
