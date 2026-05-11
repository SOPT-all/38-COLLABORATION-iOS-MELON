//
//  UIImage+.swift
//  Melon-iOS
//
//  Created by 성환 on 5/11/26.
//

import UIKit

extension UIImage {
    func resize(to size: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
