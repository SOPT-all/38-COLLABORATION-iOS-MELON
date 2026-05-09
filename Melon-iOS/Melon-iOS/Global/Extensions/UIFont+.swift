//
//  UIFont+.swift
//  Melon-iOS
//
//  Created by 초긍정행운의포춘쿠키 on 5/10/26.
//
import UIKit

extension UIFont {
    static func appFont(weight: UIFont.Weight, size fontSize: CGFloat) -> UIFont {
        let familyName = "AppleSDGothicNeo"
        let weightString: String
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
    
    static let title_sb_40 = UIFont.appFont(weight: .semibold, size: 40)
    static let title_b_36 = UIFont.appFont(weight: .bold, size: 36)
    static let title_b_22 = UIFont.appFont(weight: .bold, size: 22)
    static let title_b_20 = UIFont.appFont(weight: .bold, size: 20)
    
    static let body_sb_18 = UIFont.appFont(weight: .semibold, size: 18)
    static let body_sb_15 = UIFont.appFont(weight: .semibold, size: 15)
    static let body_r_15 = UIFont.appFont(weight: .regular, size: 15)
    static let body_r_14 = UIFont.appFont(weight: .regular, size: 14)
    static let body_r_13 = UIFont.appFont(weight: .regular, size: 13)
    
    static let caption_r_12 = UIFont.appFont(weight: .regular, size: 12)
    static let caption_r_11 = UIFont.appFont(weight: .regular, size: 11)
    static let caption_r_10 = UIFont.appFont(weight: .regular, size: 10)
}
