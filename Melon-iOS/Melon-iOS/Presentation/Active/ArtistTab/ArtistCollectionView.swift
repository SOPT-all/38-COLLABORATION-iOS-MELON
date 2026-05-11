//
//  ArtistCollectionView.swift
//  Melon-iOS
//
//  Created by 초긍정행운의포춘쿠키 on 5/11/26.
//

import UIKit

import SnapKit
import Then

final class ArtistCollectionView: UIView {
    
    private let flowLayout = UICollectionViewFlowLayout().then {
        $0.itemSize = CGSize(width: 100, height: 127)
        $0.scrollDirection = .horizontal
        $0.minimumInteritemSpacing = 10
    }
    
    private let imageList = ImageModel.dummy()
    
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: flowLayout
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .appBlack
        addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.snp.makeConstraints {
            $0.height.equalTo(130)
            $0.leading.equalToSuperview().inset(20)
            $0.verticalEdges.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        collectionView.dataSource = self
        register()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func register() {
        collectionView.register(
            ArtistCell.self,forCellWithReuseIdentifier: ArtistCell.identifier
        )
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

#Preview {
    let view = ArtistCollectionView()
    view.backgroundColor = .appBlack
    view.frame = CGRect(x: 0, y: 0, width: 393, height: 130)
    return view
}
