//
//  MusicTracksTableViewModel.swift
//  WhiteNoise-SwiftUI
//
//  Created by Александра Башкирова on 05.07.2020.
//  Copyright © 2020 Alexandra Bashkirova. All rights reserved.
//

import Foundation
import Combine

protocol MusicListDelegate: class {
    func didSelect(audioTrack: AudioData, isPlayed: Bool)
}

class MusicTracksTableViewModel: ObservableObject {
    private let musicTrackViewModelFactory: MusicTrackViewModelFactory
    
    weak var delegate: MusicListDelegate?
    @Published var trackViewModels: [MusicTrackViewModel]?
    
    init(
        category: CategoryData?,
        musicTrackViewModelFactory: MusicTrackViewModelFactory
    ) {
        self.musicTrackViewModelFactory = musicTrackViewModelFactory
        if let category = category {
            trackViewModels = musicTrackViewModelFactory.createMusicTrackViewModels(audioList: category.audioList, delegate: self)
        } else {
            trackViewModels = musicTrackViewModelFactory.createEmptyMusicList()
        }
    }
    
    func updateMusicList(category: CategoryData) {
        trackViewModels = musicTrackViewModelFactory.createMusicTrackViewModels(audioList: category.audioList, delegate: self)
    }

    func setIsPlayingForFirstTrack() -> AudioData? {
        guard
                let firstTrackVM = trackViewModels?.first,
                let firstAudio = firstTrackVM.audio
                else {
            return nil
        }

        firstTrackVM.isPlayed = true
        return firstAudio
    }

    func stopTrack() {
        guard let trackViewModels = trackViewModels else { return }

        trackViewModels.filter {
            $0.isPlayed == true
        }.forEach {
            $0.isPlayed.toggle()
        }
    }
    
    func playTrack() {
        guard let trackViewModels = trackViewModels else { return }

        trackViewModels.first?.isPlayed = true
        
    }
}

extension MusicTracksTableViewModel: MusicTrackDelegate {
    func didSelect(audioTrack: AudioData, isPlayed: Bool) {
        guard let trackViewModels = trackViewModels else { return }
        
        if isPlayed {
            trackViewModels.filter {
                $0.audio != audioTrack && $0.isPlayed == true
            }.forEach {
                $0.isPlayed.toggle()
            }
        }
        delegate?.didSelect(audioTrack: audioTrack, isPlayed: isPlayed)
    }
}
