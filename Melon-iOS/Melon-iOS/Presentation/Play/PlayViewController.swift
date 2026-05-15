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

    // MARK: - Life Cycle
    
    override func loadView() {
        view = rootView
        navigationController?.setNavigationBarHidden(true, animated: false)
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
        rootView.toggleHeart()
    }
    
    @objc
    private func playButtonDidTap() {
        rootView.togglePlay()
    }
}
