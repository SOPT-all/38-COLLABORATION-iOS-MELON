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
    
    private let filterView = FilterBarView(items: ["1": "TOP100", "2": "HOT100", "3": "2006년 해외", "4": "달달한"], selectedID: "1")

    private let listenButton = UIButton()
    private let chartView = UICollectionView(frame: .zero, collectionViewLayout: ChartLayout.make())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setDelegate()
        register()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setUI() {
        addSubviews(filterView, chartView, listenButton)
    }
    
    override func setLayout() {
        filterView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        
        chartView.snp.makeConstraints {
            $0.top.equalTo(filterView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        
        listenButton.snp.makeConstraints {
            $0.top.equalTo(chartView.snp.bottom).offset(14)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
    }
    
    override func setStyle() {
        backgroundColor = .appBlack
        
        chartView.do {
            $0.backgroundColor = .appBlack
            $0.dataSource = self
            $0.showsHorizontalScrollIndicator = false
        }
        
        listenButton.do {
            $0.setTitle("TOP 100 전체 듣기", for: .normal)
            $0.setTitleColor(.appWhite, for: .normal)
            $0.backgroundColor = .gray600
            $0.layer.cornerRadius = 4
            $0.titleLabel?.font = .body_r_15
        }
    }
    
    private func setDelegate() {
        chartView.dataSource = self
    }
        
    private func register() {
        chartView.register(ChartCell.self, forCellWithReuseIdentifier: ChartCell.identifier)
    }
    
    struct ChartSong {
        let image: UIImage
        let rank: Int
        let title: String
        let rankChange: String
        let singer: String
    }

    private let chartItems: [ChartSong] = [
        .init(image: UIImage(resource: .imgHomeMelonchart1), rank: 1, title: "소문의 낙원", rankChange: "-", singer: "AKMU (악뮤)"),
        .init(image: UIImage(resource: .imgHomeMelonchart1), rank: 2, title: "기쁨, 슬픔, 아름다운 마음", rankChange: "▲ 2", singer: "AKMU (악뮤)"),
        .init(image: UIImage(resource: .imgHomeMelonchart2), rank: 3, title: "RUDE!", rankChange: "new", singer: "Hearts2Hearts"),
        .init(image: UIImage(resource: .imgHomeMelonchart3), rank: 4, title: "IVE", rankChange: "▼ 1", singer: "IVE (아이브)"),
        .init(image: UIImage(resource: .imgHomeMelonchart4), rank: 5, title: "404(New Era)", rankChange: "-", singer: "KiiiKiii (키키)"),
        .init(image: UIImage(resource: .imgHomeMelonchart5), rank: 6, title: "SWIM", rankChange: "-", singer: "방탄소년단"),
        .init(image: UIImage(resource: .imgHomeMelonchart6), rank: 7, title: "사랑하게 될 거야", rankChange: "-", singer: "한로로"),
        .init(image: UIImage(resource: .imgHomeMelonchart7), rank: 8, title: "Drowning", rankChange: "-", singer: "WOODZ")
    ]
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
        cell.configure(
            image: song.image,
            rank: song.rank,
            title: song.title,
            rankChange: song.rankChange,
            singer: song.singer
        )
        
        return cell
    }
}
