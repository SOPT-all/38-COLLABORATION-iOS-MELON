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
    
    private var songListItems: [artistSongDTO] = []

    private let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: ActiveLayout.songList()
    )
    
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
    
    func updateSongList(items: [artistSongDTO]) {
        songListItems = items
        collectionView.reloadData()
    }

    // MARK: - UI Settings

    override func setStyle() {
        collectionView.backgroundColor = .clear
        collectionView.alwaysBounceVertical = false
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
        songListItems.count
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

        cell.configure(songListItems[indexPath.item])
        return cell
    }
}

extension SongListView: UICollectionViewDelegate {}
