//
//  ChipButton.swift
//  Melon-iOS
//
//  Created by 이상엽 on 5/13/26.
//

import UIKit

final class ChipButton: UIButton {
    
    init(text: String, image: UIImage? = nil) {
        super.init(frame: .zero)
        
        configure(text: text, image: image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(text: String, image: UIImage? = nil) {
        var config = UIButton.Configuration.bordered()
        config.background.strokeWidth = 0.25
        config.background.strokeColor = .gray300
        config.baseBackgroundColor = .clear
        config.background.cornerRadius = 50
        config.contentInsets = NSDirectionalEdgeInsets(top: 5.5, leading: 9, bottom: 5.5, trailing: 9)
        config.attributedTitle = AttributedString(
            text,
            attributes: AttributeContainer([
                .font: UIFont.body_r_13,
                .foregroundColor: UIColor.appWhite
            ])
        )
        
        if let image {
            config.image = image
                .withRenderingMode(.alwaysOriginal)
            config.imagePadding = 3
        }
        
        configuration = config
        clipsToBounds = true
    }
}
