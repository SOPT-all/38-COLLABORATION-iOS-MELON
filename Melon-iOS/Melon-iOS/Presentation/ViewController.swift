//
//  ViewController.swift
//  Melon-iOS
//
//  Created by 이상엽 on 5/7/26.
//

import UIKit

import SnapKit
import Then

class ViewController: UIViewController {

    private let albumListView = AlbumListView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(albumListView)
        albumListView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
