//
//  EventSectionView.swift
//  Melon-iOS
//
//  Created by h2e on 5/13/26.
//

import UIKit

import SnapKit
import Then

final class EventSectionView: BaseView {
    
    private let items: [EventItem] = EventItem.dummy
    
    private let eventHeaderView = HomeDetailSectionHeaderView(subtitle: "아티스트와 함께", title: "이벤트", icon: .iconBrand2Green)
    
    private let eventTitleLabel = UILabel()
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: EventLayout.make())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setDelegate()
        register()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    override func setUI() {
        addSubviews(eventHeaderView, eventTitleLabel, collectionView)
    }
    
    override func setLayout() {
        eventHeaderView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
        }
        
        eventTitleLabel.snp.makeConstraints {
            $0.top.equalTo(eventHeaderView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(22)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(eventTitleLabel.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(204)
            $0.bottom.equalToSuperview()
        }
    }
    
    override func setStyle() {
        eventHeaderView.do {
            $0.titleLabel.font = .title_b_20
        }
        
        eventTitleLabel.do {
            $0.font = .body_sb_18
            $0.textColor = .appWhite
            $0.text = "지금 가장 기대되는 2026 페스티벌"
        }
        
        collectionView.do {
            $0.backgroundColor = .appBlack
            $0.showsHorizontalScrollIndicator = false
            $0.alwaysBounceVertical = false
            $0.bounces = false
        }
    }
    
    private func setDelegate() {
        collectionView.dataSource = self
    }
    
    private func register() {
        collectionView.register(EventCard.self, forCellWithReuseIdentifier: EventCard.identifier)
    }
}

extension EventSectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventCard.identifier, for: indexPath) as? EventCard else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: items[indexPath.item])
        return cell
    }
}
