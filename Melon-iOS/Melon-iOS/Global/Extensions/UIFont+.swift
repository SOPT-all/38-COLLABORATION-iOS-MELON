//
//  UIFont+.swift
//  Melon-iOS
//
//  Created by 초긍정행운의포춘쿠키 on 5/10/26.
//
import UIKit

extension UIFont{
    static func appFont(weight: UIFont.Weight, size fontSize: CGFloat) -> UIFont {
        let familyName = "AppleSDGothicNeo"
        
        var weightString: String
        switch weight {
        case .semibold:
            weightString = "SemiBold"
        case .bold:
            weightString = "Bold"
        case .regular:
            weightString = "Regular"
        default:
            weightString = "Regular"
        }
    
        return UIFont(name: "\(familyName)-\(weightString)", size: fontSize) ?? .systemFont(ofSize: fontSize, weight: weight)
    }
    
}

