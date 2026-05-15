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
    
    private let rootView = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = rootView
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
