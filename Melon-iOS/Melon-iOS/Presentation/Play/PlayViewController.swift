//
//  PlayViewController.swift
//  Melon-iOS
//
//  Created by 이상엽 on 5/12/26.
//

import UIKit

final class PlayViewController: BaseViewController {
    
    // MARK: - Properties
    
    private let rootView = PlayView()
    private let service = DefaultSongDetailService()
    private var songId = 0
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        getSongDetail()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        rootView.hideSwipeGuide()
    }
    
    // MARK: - Setup Methods
    
    override func setAction() {
        rootView.heartButton.addTarget(self, action: #selector(heartButtonDidTap), for: .touchUpInside)
        rootView.playButton.addTarget(self, action: #selector(playButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc
    private func heartButtonDidTap() {
        likeToggle()
    }
    
    @objc
    private func playButtonDidTap() {
        rootView.togglePlay()
    }
    
    // MARK: - Functions
    
    private func getSongDetail() {
        makeRandomNumber()
        
        Task {
            do {
                let song = try await service.getSongDetail(songId: songId)
                let artistName = song.artists.map { $0.name }.joined(separator: ", ")
                
                rootView.configure(title: song.title, name: artistName, imgURL: song.album.imageUrl, likes: song.likeCount, isLiked: song.isLiked, playTime: song.playTime)
            } catch {
                print("곡 정보 조회 실패: \(error)")
            }
        }
    }
    
    private func likeToggle() {
        Task {
            do {
                let result = try await service.postLikeSong(songId: songId)
                rootView.toggleHeart(isLiked: result.isLiked)
            } catch {
                print("곡 좋아요 실패: \(error)")
            }
        }
    }
    
    func makeRandomNumber() {
        songId = Int.random(in: 1...84)
    }
}
