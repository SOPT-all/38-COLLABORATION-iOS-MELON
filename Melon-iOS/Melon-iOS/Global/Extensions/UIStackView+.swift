//
//  UIStackView+.swift
//  Melon-iOS
//
//  Created by 이상엽 on 5/10/26.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach {
            self.addArrangedSubview($0)
        }
    }
}
