//
//  EventLayout.swift
//  Melon-iOS
//
//  Created by h2e on 5/13/26.
//

import UIKit


enum EventLayout {
    static func make() -> UICollectionViewLayout {
        let wideItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(252), heightDimension: .absolute(188)))
        
        let narrowItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(143), heightDimension: .absolute(188)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(407), heightDimension: .absolute(188)), subitems: [wideItem, narrowItem])
        group.interItemSpacing = .fixed(12)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = .init(top: 8, leading: 20, bottom: 8, trailing: 20)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
}
