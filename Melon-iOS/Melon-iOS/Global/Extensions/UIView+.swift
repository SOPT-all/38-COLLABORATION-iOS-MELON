//
//  UIView+.swift
//  Melon-iOS
//
//  Created by 이상엽 on 5/10/26.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
    }
}
