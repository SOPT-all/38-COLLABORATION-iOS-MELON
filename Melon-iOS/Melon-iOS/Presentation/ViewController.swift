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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let a = MyActivitySectionView()
        //  let a = ArtistMemberSectionView()
        view.addSubview(a)
        view.backgroundColor = .gray600
        a.snp.makeConstraints {
            $0.top.equalToSuperview().inset(200)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            
        }
        
        // Do any additional setup after loading the view.
    }
}
