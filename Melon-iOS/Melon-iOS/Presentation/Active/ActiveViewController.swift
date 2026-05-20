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
    
    var artistId: Int = 10
    
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
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    // MARK: - Functions
    
    private func fetchArtistDetail() {
        Task {
            do {
                let response = try await artistDetailService.getArtistDetail(artistId: artistId)
                
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
}
