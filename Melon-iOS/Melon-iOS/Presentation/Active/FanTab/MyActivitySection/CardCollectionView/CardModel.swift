//
//  CardModel.swift
//  Melon-iOS
//
//  Created by 초긍정행운의포춘쿠키 on 5/13/26.
//

import UIKit

struct CardModel {
    let card: UIImage
    let cardText: String
    let cardTitle : String
}


extension CardModel {
    static func dummy() -> [CardModel] {
        return [
            CardModel(card: .imgActiveFeaturedtrackcard1, cardText: "처음 좋아요한 곡", cardTitle: "FOCUS"),
            CardModel(card: .imgActiveFeaturedtrackcard2, cardText: "처음 댓글남긴 곡", cardTitle: "RUDE!"),
            CardModel(card: .imgActiveFeaturedtrackcard3, cardText: "처음 저장한 곡", cardTitle: "THE CHASE")
        ]
    }
}
