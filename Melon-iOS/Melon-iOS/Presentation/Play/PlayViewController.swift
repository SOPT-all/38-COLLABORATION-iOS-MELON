//
//  PlayViewController.swift
//  Melon-iOS
//
//  Created by 이상엽 on 5/12/26.
//

import UIKit

final class PlayViewController: BaseViewController {
    let rootView = PlayView()

    override func loadView() {
        view = rootView
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        rootView.hideSwipeGuide()
    }
    
    override func setAction() {
        rootView.heartButton.addTarget(self, action: #selector(heartButtonDidTap), for: .touchUpInside)
    }
    
    @objc
    private func heartButtonDidTap() {
        rootView.toggleHeart()
    }
}
