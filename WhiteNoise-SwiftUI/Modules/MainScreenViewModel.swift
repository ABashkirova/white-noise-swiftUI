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
        playerViewModel = PlayerViewModel(volume: Double(player.currentVolume))
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
    func setVolume(_ volume: Double) {
        player.setVolume(volume)
    }

    func stop() {
        musicTracksTableViewModel.stopTrack()
        player.stop()
    }

    func play() {
        if let currentAudio = player.currentAudio {
            musicTracksTableViewModel.playTrack(currentAudio)
        } else {
            // Установим в плеер первую мелодию открытой категории
            guard
                let audio = musicTracksTableViewModel.setIsPlayingForFirstTrack()
            else {
                return
            }

            player.setAudio(audio)
        }
        player.play()
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
