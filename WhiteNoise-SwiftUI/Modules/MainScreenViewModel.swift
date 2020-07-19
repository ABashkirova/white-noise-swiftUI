//
//  MainScreenViewModel.swift
//  WhiteNoise-SwiftUI
//
//  Created by Александра Башкирова on 05.07.2020.
//  Copyright © 2020 Alexandra Bashkirova. All rights reserved.
//

import Foundation
import Combine

class MainScreenViewModel: ObservableObject {
    private let player: NoisePlayer
    var menuViewModel: CategoryMenuViewModel
    var playerViewModel: PlayerViewModel
    var cardViewModel: CategoryCardViewModel
    var musicTracksTableViewModel: MusicTracksTableViewModel
    var mainScreenViewsFactory: MainScreenViewsFactory

    init(
        categoryRepository: CategoryRepository,
        player: NoisePlayer,
        categoryMenuItemViewModelFactory: CategoryMenuItemViewModelFactory,
        musicTrackViewModelFactory: MusicTrackViewModelFactory
    ) {
        self.player = player
        let categories = categoryRepository.getCategories()
        let firstCategory = categories.first
        
        menuViewModel = CategoryMenuViewModel(
            categories: categories,
            categoryMenuItemViewModelFactory: categoryMenuItemViewModelFactory)
        playerViewModel = PlayerViewModel()
        cardViewModel = CategoryCardViewModel(category: firstCategory)
        musicTracksTableViewModel = MusicTracksTableViewModel(
            category: firstCategory,
            musicTrackViewModelFactory: musicTrackViewModelFactory)
        menuViewModel.setActiveCategory(category: firstCategory)
        
        self.mainScreenViewsFactory = MainScreenViewsFactory(
            menuViewModel: menuViewModel,
            playerViewModel: playerViewModel,
            musicTrackTableViewModel: musicTracksTableViewModel,
            categoryCardViewModel: cardViewModel
        )
        
        menuViewModel.delegate = self
        musicTracksTableViewModel.delegate = self
        playerViewModel.delegate = self
    }
}

extension MainScreenViewModel: PlayerDelegate {
    func stop() {
        musicTracksTableViewModel.stopTrack()
    }
    
    func play() {
        musicTracksTableViewModel.playTrack()
    }
}

extension MainScreenViewModel: CategoryMenuDelegate {
    func didSelect(category: CategoryData) {
        cardViewModel.update(category: category)
        musicTracksTableViewModel.updateMusicList(
                category: category,
                currentAudio: player.currentAudio,
                isPlaying: player.isPlaying)
    }
}

extension MainScreenViewModel: MusicListDelegate {
    func didSelect(audioTrack: AudioData, isPlayed: Bool) {
        playerViewModel.isPlayed = isPlayed
        
        if (isPlayed) {
            player.setAudio(audioTrack)
            player.play()
        } else {
            player.stop()
        }
    }
}
