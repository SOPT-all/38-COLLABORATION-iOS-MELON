//
//  FilterBarView.swift
//  Melon-iOS
//
//  Created by h2e on 5/11/26.
//

import UIKit

import SnapKit
import Then

final class FilterBarView: UIView {
    
    struct Item: Filterable {
        let id: String
        let title: String
    }

    var onSelect: ((_ id: String, _ title: String) -> Void)?
    
    init(items: KeyValuePairs<String, String>, selectedID: String? = nil) {
        super.init(frame: .zero)
        setUI()
        setLayout()
        setDelegate()
        setStyle()
        register()
        configure(items: items, selectedID: selectedID)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure(items: KeyValuePairs<String, String>, selectedID: String? = nil) {
        self.items = items.map { Item(id: $0.key, title: $0.value) }
        self.selectedID = selectedID ?? self.items.first?.id
        collectionView.reloadData()
    }
    
    private var items: [Item] = []
    private var selectedID: String?
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: FilterBarLayout.make())
    
    
    private func setUI() {
        addSubview(collectionView)
    }
    
    private func setLayout() {
        collectionView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    private func setDelegate() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func register() {
        collectionView.register(FilterBarChipCell.self, forCellWithReuseIdentifier: FilterBarChipCell.identifier)
    }
    
    private func setStyle() {
        collectionView.backgroundColor = .black
        collectionView.showsHorizontalScrollIndicator = false
    }
}

extension FilterBarView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: FilterBarChipCell.identifier,
            for: indexPath) as? FilterBarChipCell else {
            return UICollectionViewCell()
        }
        let item = items[indexPath.item]
        cell.configure(title: item.title, isSelected: item.id == selectedID)
        return cell
    }
}

extension FilterBarView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        let item = items[indexPath.item]
        selectedID = item.id
        collectionView.reloadData()
        onSelect?(item.id, item.title)
    }
}
