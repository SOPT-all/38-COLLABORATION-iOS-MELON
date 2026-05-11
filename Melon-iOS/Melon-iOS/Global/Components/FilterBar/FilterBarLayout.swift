//
//  FilterBarLayout.swift
//  Melon-iOS
//
//  Created by h2e on 5/11/26.
//

import UIKit

enum FilterBarLayout {
    
    private enum Style {
            static let chipHeight: CGFloat = 38
            static let chipEstimatedWidth: CGFloat = 92
            static let interItemSpacing: CGFloat = 10
            static let sectionInsetHorizontal: CGFloat = 16
        }
    
    static func make() -> UICollectionViewCompositionalLayout {
        
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .estimated(Style.chipEstimatedWidth),
                heightDimension: .fractionalHeight(1.0)
                )
            )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .estimated(Style.chipEstimatedWidth), heightDimension: .absolute(Style.chipHeight)
                ),
                subitems: [item]
            )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = Style.interItemSpacing
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: Style.sectionInsetHorizontal,
            bottom: 0,
            trailing: Style.sectionInsetHorizontal
            )
        
        return UICollectionViewCompositionalLayout(section: section)
    }
        
}
