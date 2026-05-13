//
//  ActiveLayout.swift
//  Melon-iOS
//
//  Created by 성환 on 5/13/26.
//

import UIKit

enum ActiveLayout {
    static func songList() -> UICollectionViewCompositionalLayout {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .estimated(44)
            )
        )

        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(319),
                heightDimension: .absolute(284)
            ),
            repeatingSubitem: item,
            count: 5
        )
        group.interItemSpacing = .fixed(16)

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 13
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 22,
            leading: 20,
            bottom: 0,
            trailing: 0
        )

        return UICollectionViewCompositionalLayout(section: section)
    }
}
