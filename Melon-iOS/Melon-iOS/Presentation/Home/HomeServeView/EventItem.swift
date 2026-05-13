//
//  EventItem.swift
//  Melon-iOS
//
//  Created by h2e on 5/13/26.
//

import UIKit

struct EventItem {
    let image: UIImage
    let title: String
    let subtitle: String
}

extension EventItem {
    static let dummy: [EventItem] = [
        .init(image: UIImage(resource: .imgHomePromotion1),
              title: "루프탑 파티: 국내 힙합",
              subtitle: "#루프탑 #국내힙합"),
        .init(image: UIImage(resource: .imgHomePromotion2), title: "루프탑 파티: 국내 힙합", subtitle: "#루프탑 #국내힙합")
        ]
}
