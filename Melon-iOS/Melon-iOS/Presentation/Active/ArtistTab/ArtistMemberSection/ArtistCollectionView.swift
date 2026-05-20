//
//  ArtistCollectionView.swift
//  Melon-iOS
//
//  Created by 초긍정행운의포춘쿠키 on 5/11/26.
//

import UIKit

import SnapKit
import Then

final class ArtistCollectionView: BaseView {
    
    //MARK: - Properties
    
    private var artists: [ArtistMember] = []
    
    private let flowLayout = UICollectionViewFlowLayout().then {
        $0.itemSize = CGSize(width: 100, height: 127)
        $0.scrollDirection = .horizontal
        $0.minimumLineSpacing = 10
    }
    
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: flowLayout
    )
    
    //MARK: - Private Methods
    
    private func register() {
        collectionView.register(ArtistCell.self,forCellWithReuseIdentifier: ArtistCell.identifier)
    }
    
    //MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        register()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Setting
    
    override func setStyle() {
        collectionView.do {
            $0.backgroundColor = .clear
            $0.dataSource = self
            $0.showsHorizontalScrollIndicator = false
        }
    }
    
    override func setUI() {
        addSubview(collectionView)
    }
    
    override func setLayout() {
        collectionView.snp.makeConstraints {
            $0.top.bottom.trailing.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
            $0.height.equalTo(127)
        }
    }
    
    func configure(_ artists: [ArtistMember]) {
        self.artists = artists
        collectionView.reloadData()
    }
}


extension ArtistCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,numberOfItemsInSection section: Int) -> Int {
        return artists.count
    }
    
    func collectionView(_ collectionView: UICollectionView,cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArtistCell.identifier, for: indexPath
        ) as! ArtistCell
        cell.configure(artists[indexPath.row])
        return cell
    }
}
