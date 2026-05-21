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
    
    var onSongListSortChanged: ((ArtistSongListFilter) -> Void)?
    
    private static let songFilterList: KeyValuePairs<String, String> = [
        ArtistSongListFilter.hot.rawValue: ArtistSongListFilter.hot.displayName,
        ArtistSongListFilter.latest.rawValue: ArtistSongListFilter.latest.displayName,
        ArtistSongListFilter.download.rawValue: ArtistSongListFilter.download.displayName,
        ArtistSongListFilter.play.rawValue: ArtistSongListFilter.play.displayName
    ]
    
    // MARK: - UI Properties
    
    private let songSectionHeader = ActiveViewSectionHeader(title: "곡")
    private let songFilterBarView = FilterBarView(items: songFilterList, selectedID: ArtistSongListFilter.hot.rawValue)
    let songCollectionView = SongListView()
    
    private let albumSectionHeader = ActiveViewSectionHeader(title: "최신 앨범")
    let albumCollectionView = AlbumListView()
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        bindSort()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
            $0.bottom.equalToSuperview().inset(70)
        }
    }
    
    // MARK: - Functions
    
    private func bindSort() {
        songFilterBarView.onSelect = { [weak self] id, _ in
            guard let sort = ArtistSongListFilter(rawValue: id) else {return}
            self?.onSongListSortChanged?(sort)
        }
    }
}
