//
//  PlayView.swift
//  Melon-iOS
//
//  Created by 이상엽 on 5/12/26.
//

import UIKit

import SnapKit
import Then
import Lottie
import Kingfisher

final class PlayView: BaseView {
    
    // MARK: - Properties
    
    private var heartCount: Int = 0
    private var isHeartSelected = false
    private var isSwipeGuideHidden = false
        
    // MARK: - UI Components
    
    private let optionButton = UIButton()
    
    private let songTitleLabel = UILabel()
    
    private let artistNameLabel = UILabel()
    
    private let musicInformationStackView = UIStackView()
    
    lazy var downButton = UIButton()
    
    private let artistChannelButton = UIButton()
    
    private let albumImageView = UIImageView()
    
    private let playMessageImage = UIImageView()
    
    private let leftMessageLabel = UILabel()
    
    private let rightMesageLabel = UILabel()
    
    private let swipeGuideContainerView = UIView()
    
    lazy var heartButton = ChipButton(text: "\(heartCount)", image: .icMiniheart)
    
    private let heartAnimationView = LottieAnimationView(name: "heart_animation")
    
    private let addSongButton = ChipButton(text: "담기", image: .icPlus)
    
    private let lyricsButton = ChipButton(text: "가사보기")
    
    private let songCustomButtonStackView = UIStackView()
    
    private let mixupButton = UIButton()
    
    private let songProgressView = UIProgressView()
    
    private let nowTimeLabel = UILabel()
    
    private let songTimeLabel = UILabel()
    
    private let shuffleButton = UIButton()
    
    private let previousButton = UIButton()
    
    lazy var playButton = UIButton()
    
    private let nextButton = UIButton()
    
    private let playButtonStackView = UIStackView()
    
    private let repeatButton = UIButton()
        
    private let equalizerButton = UIButton()
    
    private let mirroringButton = UIButton()
    
    private let playListButton = UIButton()
    
    private let playlistContainerView = PlaylistContainerView()
    
    // MARK: - Setup Methods
    
    override func setUI() {
        musicInformationStackView.addArrangedSubviews(songTitleLabel, artistNameLabel)
        songCustomButtonStackView.addArrangedSubviews(heartButton, addSongButton, lyricsButton)
        swipeGuideContainerView.addSubviews(playMessageImage, leftMessageLabel, rightMesageLabel)
        playButtonStackView.addArrangedSubviews(previousButton, playButton, nextButton)
        
        addSubviews(
            optionButton,
            musicInformationStackView,
            downButton,
            artistChannelButton,
            albumImageView,
            swipeGuideContainerView,
            mixupButton,
            songCustomButtonStackView,
            songProgressView,
            nowTimeLabel,
            songTimeLabel,
            shuffleButton,
            heartAnimationView,
            playButtonStackView,
            repeatButton,
            equalizerButton,
            mirroringButton,
            playListButton,
            playlistContainerView
        )
    }
    
    override func setStyle() {
        backgroundColor = .appBlack

        optionButton.do {
            $0.setImage(UIImage(resource: .icMoreVertical2), for: .normal)
        }
        
        musicInformationStackView.do {
            $0.axis = .vertical
            $0.alignment = .leading
            $0.spacing = 0
        }
        
        songTitleLabel.do {
            $0.text = "RUDE!"
            $0.textColor = .appWhite
            $0.font = .title_b_20
        }
        
        artistNameLabel.do {
            $0.text = "Hearts2Hearts (하츠투하츠)"
            $0.textColor = .appWhite
            $0.font = .body_r_13
        }
        
        downButton.do {
            $0.setImage(UIImage(resource: .icChevronDown), for: .normal)
        }
        
        artistChannelButton.do {
            var config = UIButton.Configuration.bordered()
            config.background.strokeWidth = 1
            config.background.strokeColor = .green03
            config.image = UIImage(resource: .icHuman)
                .resize(to: CGSize(width: 16, height: 16))
                .withRenderingMode(.alwaysTemplate)
            config.baseForegroundColor = .green03
            config.imagePadding = 3
            config.baseBackgroundColor = .clear
            config.background.cornerRadius = 50
            config.contentInsets = NSDirectionalEdgeInsets(top: 5.5, leading: 9, bottom: 5.5, trailing: 9)
            config.attributedTitle = AttributedString(
                "아티스트 채널로 이동",
                attributes: AttributeContainer([
                    .font: UIFont.body_r_13,
                    .foregroundColor: UIColor.green03
                ])
            )
            
            $0.configuration = config
        }
        
        albumImageView.do {
            $0.image = .imgPlayThumnail2
            $0.contentMode = .scaleAspectFit
            $0.layer.cornerRadius = 4
            $0.clipsToBounds = true
        }
        
        playMessageImage.do {
            $0.image = .playMessage
            $0.contentMode = .scaleAspectFit
        }
        
        leftMessageLabel.do {
            $0.text = "스와이프 이전 곡으로"
            $0.font = .caption_r_11
            $0.textColor = .appWhite
        }
        
        rightMesageLabel.do {
            $0.text = "스와이프 다음 곡으로"
            $0.font = .caption_r_11
            $0.textColor = .appWhite
        }
        
        heartAnimationView.do {
            $0.contentMode = .scaleAspectFit
            $0.loopMode = .playOnce
            $0.currentProgress = 0
            $0.isHidden = true
            $0.isUserInteractionEnabled = false
        }
        
        songCustomButtonStackView.do {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.spacing = 9
        }
        
        mixupButton.do {
            var config = UIButton.Configuration.bordered()
            config.background.strokeWidth = 0.25
            config.background.strokeColor = .gray300
            config.image = UIImage(resource: .imgMixup)
                .resize(to: CGSize(width: 21, height: 21))
            config.imagePadding = 3
            config.baseBackgroundColor = .clear
            config.background.cornerRadius = 40
            config.contentInsets = NSDirectionalEdgeInsets(top: 3, leading: 9, bottom: 3, trailing: 9)
            config.attributedTitle = AttributedString(
                "믹스업",
                attributes: AttributeContainer([
                    .font: UIFont.body_r_13,
                    .foregroundColor: UIColor.appWhite
                ])
            )
            
            $0.configuration = config
        }
        
        songProgressView.do {
            $0.progress = 0.15
            $0.progressTintColor = .green02
            $0.trackTintColor = .gray600
        }
        
        nowTimeLabel.do {
            $0.text = "1:07"
            $0.textColor = .appWhite
            $0.font = .caption_r_12
        }
        
        songTimeLabel.do {
            $0.text = "2:50"
            $0.textColor = .gray600
            $0.font = .caption_r_12
        }
        
        shuffleButton.do {
            $0.setImage(UIImage(resource: .icShuffle), for: .normal)
        }
        
        previousButton.do {
            $0.setImage(UIImage(resource: .icPlaypreviousBig), for: .normal)
        }
        
        playButton.do {
            $0.setImage(UIImage(resource: .icPlayBig), for: .normal)
        }
        
        nextButton.do {
            $0.setImage(UIImage(resource: .icPlayNextBig), for: .normal)
        }
        
        playButtonStackView.do {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.spacing = 40
        }
        
        repeatButton.do {
            $0.setImage(UIImage(resource: .icRepeat), for: .normal)
        }
        
        equalizerButton.do {
            $0.setImage(UIImage(resource: .icEq), for: .normal)
        }
        
        mirroringButton.do {
            $0.setImage(UIImage(resource: .icMiddle), for: .normal)
        }
        
        playListButton.do {
            $0.setImage(UIImage(resource: .icPlaylistThin), for: .normal)
        }
        
    }
    
    override func setLayout() {
        optionButton.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.equalToSuperview().inset(20)
            $0.size.equalTo(24)
        }
        
        musicInformationStackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.equalTo(optionButton.snp.trailing).offset(23)
            $0.trailing.equalTo(downButton.snp.leading).offset(-33)
        }
        
        downButton.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.trailing.equalToSuperview().inset(20)
            $0.size.equalTo(24)
        }
        
        artistChannelButton.snp.makeConstraints {
            $0.top.lessThanOrEqualTo(musicInformationStackView.snp.bottom).offset(21)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(27)
        }
        
        albumImageView.snp.makeConstraints {
            $0.top.equalTo(artistChannelButton.snp.bottom).offset(21)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(291)
        }
        
        playMessageImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        leftMessageLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(18)
        }
        
        rightMesageLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(18)
        }
        
        swipeGuideContainerView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(albumImageView.snp.top).offset(120)
            $0.horizontalEdges.equalToSuperview()
        }
        
        heartAnimationView.snp.makeConstraints {
            $0.centerX.equalTo(heartButton.snp.leading).offset(28)
            $0.centerY.equalTo(heartButton).offset(-38)
            $0.size.equalTo(96)
        }
        
        songCustomButtonStackView.snp.makeConstraints {
            $0.top.equalTo(albumImageView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(20)
        }
        
        mixupButton.snp.makeConstraints {
            $0.centerY.equalTo(songCustomButtonStackView.snp.centerY)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        songProgressView.snp.makeConstraints {
            $0.top.equalTo(songCustomButtonStackView.snp.bottom).offset(24)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        nowTimeLabel.snp.makeConstraints {
            $0.top.equalTo(songProgressView.snp.bottom).offset(4)
            $0.leading.equalToSuperview().inset(20)
        }
        
        songTimeLabel.snp.makeConstraints {
            $0.top.equalTo(nowTimeLabel.snp.top)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        shuffleButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.centerY.equalTo(playButtonStackView)
        }
        
        playButtonStackView.snp.makeConstraints {
            $0.top.equalTo(songProgressView.snp.bottom).offset(35)
            $0.centerX.equalToSuperview()
        }
        
        repeatButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.centerY.equalTo(playButtonStackView)
        }
        
        equalizerButton.snp.makeConstraints {
            $0.top.equalTo(repeatButton.snp.bottom).offset(19)
            $0.leading.equalToSuperview().inset(20)
        }
        
        mirroringButton.snp.makeConstraints {
            $0.top.equalTo(equalizerButton.snp.top)
            $0.centerX.equalToSuperview()
        }
        
        playListButton.snp.makeConstraints {
            $0.top.equalTo(equalizerButton.snp.top)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        playlistContainerView.snp.makeConstraints {
            $0.top.equalTo(mirroringButton.snp.bottom).offset(12)
            $0.bottom.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(9)
        }
    }
    
    // MARK: - Functions
    
    func hideSwipeGuide() {
        guard !isSwipeGuideHidden else { return }
        isSwipeGuideHidden = true
        
        UIView.animate(
            withDuration: 0.4,
            delay: 5,
            options: .curveEaseInOut
        ) {
            self.swipeGuideContainerView.alpha = 0
        } completion: { [weak self] _ in
            self?.swipeGuideContainerView.isHidden = true
        }
    }
    
    func toggleHeart(isLiked: Bool) {
        isHeartSelected = isLiked
        
        heartButton.configure(
            text: isHeartSelected ? "\(heartCount + 1)" : "\(heartCount)",
            image: isHeartSelected ? .icMiniheartPressed : .icMiniheart
        )
        
        if isHeartSelected {
            playHeartAnimation()
        } else {
            stopHeartAnimation()
        }
    }
    
    private func playHeartAnimation() {
        heartAnimationView.isHidden = false
        heartAnimationView.stop()
        heartAnimationView.currentProgress = 0
        heartAnimationView.play { [weak self] _ in
            self?.heartAnimationView.isHidden = true
        }
    }
    
    private func stopHeartAnimation() {
        heartAnimationView.stop()
        heartAnimationView.currentProgress = 0
        heartAnimationView.isHidden = true
    }
    
    func togglePlay() {
        playButton.isSelected.toggle()
        playButton.setImage(UIImage(resource: playButton.isSelected ? .icStopBig : .icPlayBig), for: .normal)
    }
    
    func configure(title: String, name: String, imgURL: String, likes: Int, isLiked: Bool, playTime: String) {
        songTitleLabel.text = title
        artistNameLabel.text = name
        heartCount = likes
        isHeartSelected = isLiked
        songTimeLabel.text = playTime
        
        let url = URL(string: imgURL)
        albumImageView.kf.setImage(with: url)
    }
}
