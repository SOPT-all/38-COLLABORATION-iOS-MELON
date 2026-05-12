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
    
    private let imageList = ArtistModel.dummy()
    
    private let flowLayout = UICollectionViewFlowLayout().then {
        $0.itemSize = CGSize(width: 100, height: 127)
        $0.scrollDirection = .horizontal
        $0.minimumLineSpacing = 10
    }
    
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: flowLayout
    )
    
    private func register() {
        collectionView.register(ArtistCell.self,forCellWithReuseIdentifier: ArtistCell.identifier)
    }
    
    override func setStyle() {
        
        collectionView.do {
            $0.backgroundColor = .clear
            $0.dataSource = self
            $0.showsHorizontalScrollIndicator = false
        }
    }
    
    override func setUI() {
        addSubview(collectionView)
        register()
    }
    
    override func setLayout() {
        collectionView.snp.makeConstraints {
            $0.top.bottom.trailing.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
            $0.height.equalTo(127)
        }
    }
}


extension ArtistCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView,cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArtistCell.identifier, for: indexPath
        ) as! ArtistCell
        cell.dataBind(imageList[indexPath.row])
        return cell
    }
}
