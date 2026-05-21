//
//  ActiveView.swift
//  Melon-iOS
//
//  Created by 성환 on 5/18/26.
//

import UIKit

import SnapKit
import Then

final class ActiveView: BaseView {
    // MARK: - Properties
    
    var onSongListSortChanged: ((ArtistSongListFilter) -> Void)? {
        get { songAlbumTabView.onSongListSortChanged }
        set { songAlbumTabView.onSongListSortChanged = newValue }
    }

    // MARK: - UI Properties

    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    let navigateBar = ActiveTopNavigateBar()
    
    let heroSection  = ActiveHeroSection()
    private let tabView = ActiveTabView(titles: ["곡•앨범", "팬 활동", "아티스트"], seletedIndex: 0)
    
    private var enabledTabView: UIView?
    let songAlbumTabView = SongAlbumTabView()
    private let fanTabView = FanTabView()
    private let artistTabView = ArtistTabView()
    
    private let musicPlayerBar = MusicPlayerBar(title: "KARMA COLLECTOR", artist: "식케이 (Sik-k), 김하온 (HAON),N...")
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setTabAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Settings

    override func setUI() {
        contentView.addSubviews(heroSection, navigateBar, tabView)
        scrollView.addSubview(contentView)
        addSubviews(scrollView, musicPlayerBar)
        showTabView(at: 0)
    }
    
    override func setStyle() {
        scrollView.do {
            $0.contentInset.bottom = 70
            $0.contentInsetAdjustmentBehavior = .never
        }
    }
    
    override func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
            $0.height.greaterThanOrEqualToSuperview().priority(.low)
        }
        
        navigateBar.snp.makeConstraints {
            $0.top.equalTo(contentView.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(44)
        }
        
        heroSection.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(522)
        }

        tabView.snp.makeConstraints {
            $0.top.equalTo(heroSection.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
        }
        
        musicPlayerBar.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide)
            $0.height.equalTo(70)
        }
    }
    
    // MARK: - Functions
    
    private func setTabAction() {
        tabView.activeTabSelected = { [weak self] index in
            self?.showTabView(at: index)
        }
    }
    
    private func showTabView(at index: Int) {
        let views: [UIView] = [songAlbumTabView, fanTabView, artistTabView]
        
        enabledTabView?.removeFromSuperview()
        
        let newView = views[index]
        contentView.addSubview(newView)
        newView.snp.makeConstraints {
            $0.top.equalTo(tabView.snp.bottom).offset(36)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview().inset(36)
        }
        enabledTabView = newView
    }
    
    func configureArtistDetail(_ response: ArtistDetailResponseDTO) {
        artistTabView.configure(response)
        heroSection.configureActiveHeroSection(response)
        songAlbumTabView.albumCollectionView.updateRecentAlbum(album: response.recentAlbums)
    }
}
