//
//  BaseView.swift
//  Melon-iOS
//
//  Created by 이상엽 on 5/10/26.
//

import UIKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .appBlack
        
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle() {}
    
    func setUI() {}
    
    func setLayout() {}
}
