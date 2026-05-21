//
//  ActiveViewController.swift
//  Melon-iOS
//
//  Created by 성환 on 5/18/26.
//

import UIKit

import SnapKit
import Then

final class ActiveViewController: BaseViewController {
    // MARK: - Properties
    
    private var artistId = Int()
    private var songTitle = String()
    private var artistName = String()
    
    private let songListService: SongListService = DefaultSongListService()
    
    private let artistDetailService: ArtistDetailService = DefaultArtistDetailService()

    private let rootView = ActiveView()
    
    // MARK: - Life Cycle

    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchArtistDetail()
        getSongList(sort: .hot)
        onSortChanged()
        rootView.configurePlayBar(title: songTitle, name: artistName)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func setAction() {
        rootView.navigateBar.previousButton.addTarget(self, action: #selector(previousButtonDidTap), for: .touchUpInside)
    }
    // MARK: - Functions
    
    private func fetchArtistDetail() {
        Task {
            do {
                let response = try await artistDetailService.getArtistDetail(artistId: artistId)
                
                let numberFormatter = NumberFormatter()
                numberFormatter.numberStyle = .decimal
                let formatterdFanCount = numberFormatter.string(from: NSNumber(value: response.fanCount))
                let formatterdCommentCount = numberFormatter.string(from: NSNumber(value: response.commentCount))
                
                rootView.heroSection.artistInfoView.configureFormatedCount(fanCount: formatterdFanCount ?? "0", commentCount: formatterdCommentCount ?? "0")
                rootView.configureArtistDetail(response)
            } catch {
                print("아티스트 상세정보 조회 실패: \(error)")
            }
        }
    }
    
    private func getSongList(sort: ArtistSongListFilter) {
        Task {
            do {
                let response = try await songListService.getSongList(artistId: artistId, sort: sort)
                
                rootView.songAlbumTabView.songCollectionView.updateSongList(items: response.artistSong)
            } catch {
                print("아티스트 곡 목록 조회 실패: \(error)")
            }
        }
    }
    
    private func onSortChanged() {
        rootView.onSongListSortChanged = { [weak self] sort in
            self?.getSongList(sort: sort)
        }
    }
    
    func bindArtistId(artistId: Int) {
        self.artistId = artistId
    }
    
    func bindSongInfo(title: String, name: String) {
        songTitle = title
        artistName = name
    }
    
    @objc
    private func previousButtonDidTap() {
        navigationController?.popViewController(animated: true)
    }
}
