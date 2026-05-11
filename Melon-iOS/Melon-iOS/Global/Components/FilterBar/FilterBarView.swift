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

    var onSelect: ((Filterable) -> Void)?
    
    private var items: [Filterable] = []
    private var selectedID: String?
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: FilterBarLayout.make())
    
    func configure(items: [Filterable], selectedID: String? = nil) {
        self.items = items
        self.selectedID = selectedID ?? items.first?.id
        collectionView.reloadData()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
        setDelegate()
        setStyle()
        register()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    private func setUI() {
        addSubview(collectionView)
        backgroundColor = .black
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
        onSelect?(item)
    }
}
