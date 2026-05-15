//
//  CardCollectionView.swift
//  Melon-iOS
//
//  Created by 초긍정행운의포춘쿠키 on 5/13/26.
//

import UIKit

import SnapKit
import Then

final class CardCollectionView: BaseView {
    //MARK: - Properties
    
    private let cardList = CardModel.dummy()
    
    private let flowLayout = UICollectionViewFlowLayout().then {
        $0.itemSize = CGSize(width: 150, height: 150)
        $0.scrollDirection = .horizontal
        $0.minimumLineSpacing = 10
    }
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    
    //MARK: - Private Methods
    
    private func register() {
        collectionView.register(CardCell.self,forCellWithReuseIdentifier: CardCell.identifier)
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
            $0.height.equalTo(150)
        }
    }
}

extension CardCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,numberOfItemsInSection section: Int) -> Int {
        return cardList.count
    }
    
    func collectionView(_ collectionView: UICollectionView,cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCell.identifier, for: indexPath
        ) as! CardCell
        cell.configure(cardList[indexPath.row])
        return cell
    }
}
