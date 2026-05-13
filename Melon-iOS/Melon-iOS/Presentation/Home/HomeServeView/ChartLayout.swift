//
//  ChartLayout.swift
//  Melon-iOS
//
//  Created by h2e on 5/12/26.
//

import UIKit

enum ChartLayout {
    static func make() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(60))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let columnSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.85), heightDimension: .absolute(240))
        let column = NSCollectionLayoutGroup.vertical(layoutSize: columnSize, subitem: item, count: 4)

        let section = NSCollectionLayoutSection(group: column)
        section.orthogonalScrollingBehavior = .groupPaging
        section.interGroupSpacing = 7
        section.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
}
