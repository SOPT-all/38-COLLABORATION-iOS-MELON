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
    
    private let collectionViewLayout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
        $0.minimumInteritemSpacing = 10
        $0.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        $0.itemSize = CGSize(width: 100, height: 127)
    }
    private lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        cv.register(ArtistCell.self,forCellWithReuseIdentifier: ArtistCell.identifier)
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}

#Preview {
    ArtistCollectionView()
}
