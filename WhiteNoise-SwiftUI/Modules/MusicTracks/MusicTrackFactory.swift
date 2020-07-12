//
//  MusicTrackFactory.swift
//  WhiteNoise-SwiftUI
//
//  Created by Александра Башкирова on 11.07.2020.
//  Copyright © 2020 Alexandra Bashkirova. All rights reserved.
//

import Foundation

class MusicTracksFactory {
}

extension MusicTracksFactory: MusicTrackViewModelFactory {
    func createEmptyMusicList() -> [MusicTrackViewModel] {
        return (0...2).map { _ in
            createMusicTrackViewModel(audioData: nil)
        }
    }
    
    func createMusicTrackViewModels(
        audioList: [AudioData],
        delegate: MusicTrackDelegate
    ) -> [MusicTrackViewModel] {
        if !audioList.isEmpty {
            return audioList.map { audio in
                print("Set music track \(audio.name)")
                let viewModel = MusicTrackViewModel(audio)
                viewModel.delegate = delegate
                return viewModel
            }
        } else {
            return createEmptyMusicList()
        }
    }
    
    private func createMusicTrackViewModel(audioData: AudioData?) -> MusicTrackViewModel {
        return MusicTrackViewModel(audioData)
    }
}

protocol MusicTrackViewModelFactory {
    func createEmptyMusicList() -> [MusicTrackViewModel]
    func createMusicTrackViewModels(audioList: [AudioData], delegate: MusicTrackDelegate) -> [MusicTrackViewModel]
}
