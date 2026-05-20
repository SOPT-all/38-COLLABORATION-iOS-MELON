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
    
    private let rootView = ActiveView()
    
    private let artistDetailService: ArtistDetailService = DefaultArtistDetailService()
    
    override func loadView() {
        view = rootView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func setView() {
        fetchArtistDetail()
    }
    
    private func fetchArtistDetail() {
        Task {
            do {
                let response = try await artistDetailService.getArtistDetail(artistId: 10)
                
                rootView.configureArtistDetail(response)
            } catch {
                print("아티스트 상세정보 조회 실패: \(error)")
            }
        }
    }
}
