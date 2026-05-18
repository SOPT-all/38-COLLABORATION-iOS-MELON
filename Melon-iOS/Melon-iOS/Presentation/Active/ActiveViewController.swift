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
    
    override func loadView() {
        view = rootView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
