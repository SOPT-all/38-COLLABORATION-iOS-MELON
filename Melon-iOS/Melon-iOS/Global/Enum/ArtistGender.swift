//
//  Gender.swift
//  Melon-iOS
//
//  Created by 초긍정행운의포춘쿠키 on 5/21/26.
//

enum ArtistGender: String, Decodable {
    case female = "F"
    case male = "M"
    
    var displayText: String {
        switch self {
        case .female:
            return "여성"
        case .male:
            return "남성"
        }
    }
}
