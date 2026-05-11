//
//  ImageModel.swift
//  Melon-iOS
//
//  Created by 초긍정행운의포춘쿠키 on 5/11/26.
//

import UIKit

struct ImageModel {
    let artistPicture: UIImage
    let artistName: String
}

extension ImageModel {
    static func dummy() -> [ImageModel] {
        return [
            ImageModel(artistPicture: .imgActiveArtistH2Hjiwoo, artistName: "지우(JIWOO)"),
            ImageModel(artistPicture: .imgActiveArtistH2Hcarmen, artistName: "카르멘(CARMEN)"),
            ImageModel(artistPicture: .imgActiveArtistH2Hyuha, artistName: "유하(YUHA)"),
            ImageModel(artistPicture: .imgActiveArtistH2Hstella, artistName: "스텔라(STELLA)")
        ]
    }
}
