//
//  HomeViewController.swift
//  Melon-iOS
//
//  Created by h2e on 5/12/26.
//

import UIKit

import SnapKit
import Then

final class HomeViewController: BaseViewController {
    
    private let homeHeader = HomeHeaderView()
    private let recommendationView = RecommendationView()
    
    private let scrollView = UIScrollView()
    private let contentStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
        setAction()
        setDelegate()
    }
    
    override func setView() {
        view.backgroundColor = .appBlack
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentStackView)
        [homeHeader, recommendationView].forEach (contentStackView.addArrangedSubview)
        
        contentStackView.do {
            $0.axis = .vertical
            $0.alignment = .fill
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
                
        contentStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(scrollView.snp.width)
        }
        
        homeHeader.snp.makeConstraints {
            $0.height.equalTo(44)
        }
    }
    
    override func setAction() {}
    
    override func setDelegate() {}
}

#if DEBUG
import SwiftUI

#Preview("Home") {
    HomeViewController()
}
#endif
