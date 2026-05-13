//
//  AlbumListView.swift
//  Melon-iOS
//
//  Created by 성환 on 5/13/26.
//

import UIKit

import SnapKit
import Then

final class AlbumListView: BaseView {
    // MARK: - Properties
    
    private let collcetionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: ActiveLayout.albumList()
    )
    
    private var itemList = AlbumListDTO.dummy()
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setDelegate()
        register()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    private func setDelegate() {
        collcetionView.dataSource = self
    }
    
    private func register() {
        collcetionView.register(AlbumListCell.self, forCellWithReuseIdentifier: AlbumListCell.identifier)
    }

    // MARK: - UI Settings
    
    override func setUI() {
        addSubviews(collcetionView)
    }

    override func setLayout() {
        collcetionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension AlbumListView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        itemList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: AlbumListCell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumListCell.identifier, for: indexPath) as? AlbumListCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(itemList[indexPath.row])
        return cell
    }
}
