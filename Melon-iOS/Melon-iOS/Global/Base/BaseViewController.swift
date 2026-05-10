//
//  BaseViewController.swift
//  Melon-iOS
//
//  Created by 이상엽 on 5/10/26.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
        setAction()
        setDelegate()
    }
    
    func setView() {}
    
    func setAction() {}
    
    func setDelegate() {}
} 
