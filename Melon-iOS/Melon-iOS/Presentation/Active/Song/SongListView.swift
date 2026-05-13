//
//  SongListView.swift
//  Melon-iOS
//
//  Created by 성환 on 5/12/26.
//

import UIKit

import SnapKit
import Then

final class SongListView: BaseView {
    // MARK: - Properties

    private let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: ActiveLayout.songList()
    )

    private var itemList = SongListDTO.dummy()
    
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
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    private func register() {
        collectionView.register(
            SongListCell.self,
            forCellWithReuseIdentifier: SongListCell.identifier
        )
    }

    // MARK: - UI Settings

    override func setStyle() {
        collectionView.backgroundColor = .clear
    }

    override func setUI() {
        addSubviews(collectionView)
    }

    override func setLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - UICollectionViewDataSource

extension SongListView: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        itemList.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: SongListCell.identifier,
                for: indexPath
            ) as? SongListCell
        else {
            return UICollectionViewCell()
        }

        cell.dataBind(itemList[indexPath.item])
        return cell
    }
}

extension SongListView: UICollectionViewDelegate {}
