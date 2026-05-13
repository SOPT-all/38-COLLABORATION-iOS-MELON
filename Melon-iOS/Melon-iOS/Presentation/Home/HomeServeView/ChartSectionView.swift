//
//  ChartSectionView.swift
//  Melon-iOS
//
//  Created by h2e on 5/12/26.
//

import UIKit

import SnapKit
import Then

final class ChartSectionView: BaseView {
    
    private let chartItems: [ChartSong] = ChartSongDTO.dummy
    
    private let chartHeaderView = HomeDetailSectionHeaderView(subtitle: "오늘 16:00 기준", title: "실시간 트렌드 멜론차트", icon: .iconBrand3Purple)
    
    private let filterView = FilterBarView(items: ["1": "TOP100", "2": "HOT100", "3": "2006년 해외", "4": "달달한"], selectedID: "1")
    
    private let chartView = UICollectionView(frame: .zero, collectionViewLayout: ChartLayout.make())

    private let listenButton = ListenButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setDelegate()
        register()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setUI() {
        addSubviews(chartHeaderView, filterView, chartView, listenButton)
    }
    
    override func setLayout() {
        chartHeaderView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        
        filterView.snp.makeConstraints {
            $0.top.equalTo(chartHeaderView.snp.bottom).offset(11)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(52)
        }
        
        chartView.snp.makeConstraints {
            $0.top.equalTo(filterView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(240)
        }
        
        listenButton.snp.makeConstraints {
            $0.top.equalTo(chartView.snp.bottom).offset(14)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(48)
            $0.bottom.equalToSuperview()
        }
    }
    
    override func setStyle() {
        chartHeaderView.do {
            $0.titleLabel.font = .body_sb_18
        }
        
        chartView.do {
            $0.backgroundColor = .appBlack
            $0.showsHorizontalScrollIndicator = false
            $0.canCancelContentTouches = true
        }
    }
    
    private func setDelegate() {
        chartView.dataSource = self
    }
        
    private func register() {
        chartView.register(ChartCell.self, forCellWithReuseIdentifier: ChartCell.identifier)
    }
}

extension ChartSectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return chartItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ChartCell.identifier,
            for: indexPath
        ) as? ChartCell else {
            return UICollectionViewCell()
        }
        
        let song = chartItems[indexPath.item]
        cell.configure(with: song)
        
        return cell
    }
}
