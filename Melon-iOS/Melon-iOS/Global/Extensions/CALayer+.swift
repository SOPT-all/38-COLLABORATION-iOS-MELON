//
//  CALayer+.swift
//  Melon-iOS
//
//  Created by 이상엽 on 5/12/26.
//

import UIKit

extension CALayer {

    enum BorderPosition: String {
        case top
        case bottom
        case left
        case right
    }

    func addBorder(position: BorderPosition, color: UIColor, width: CGFloat) {
        removeBorder(position: position)

        let borderLayer = CALayer()
        borderLayer.name = "Border_\(position.rawValue)"
        borderLayer.backgroundColor = color.cgColor

        switch position {
        case .top:
            borderLayer.frame = CGRect(
                x: 0,
                y: 0,
                width: frame.width,
                height: width
            )
        case .bottom:
            borderLayer.frame = CGRect(
                x: 0,
                y: frame.height - width,
                width: frame.width,
                height: width
            )
        case .left:
            borderLayer.frame = CGRect(
                x: 0,
                y: 0,
                width: width,
                height: frame.height
            )
        case .right:
            borderLayer.frame = CGRect(
                x: frame.width - width,
                y: 0,
                width: width,
                height: frame.height
            )
        }

        addSublayer(borderLayer)
    }

    func removeBorder(position: BorderPosition) {
        sublayers?.removeAll {
            $0.name == "Border_\(position.rawValue)"
        }
    }
}
