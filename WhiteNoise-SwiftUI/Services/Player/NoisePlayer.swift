//
//  NoisePlayer.swift
//  WhiteNoise-SwiftUI
//
//  Created by Александра Башкирова on 18.07.2020.
//  Copyright © 2020 Alexandra Bashkirova. All rights reserved.
//

import Foundation
import AVFoundation

class NoisePlayer {
    private var player: AVAudioPlayer?
    var currentVolume: Float = 0.5 {
        didSet {
            player?.volume = currentVolume
        }
    }
    var currentAudio: AudioData?
    var isPlaying: Bool {
        player?.isPlaying ?? false
    }

    private func makePlayer(audioTrack: AudioData) -> AVAudioPlayer? {
        let url = Bundle.main.url(
            forResource: audioTrack.name,
            withExtension: "mp3")!
        let player = try? AVAudioPlayer(contentsOf: url)
        player?.numberOfLoops = -1
        player?.volume = currentVolume
        return player
    }
}

// MARK: player
extension NoisePlayer {
    func setAudio(_ audio: AudioData) {
        currentAudio = audio
        player = makePlayer(audioTrack: audio)
    }
    
    func play() {
        player?.play()
    }
    
    func stop() {
        player?.pause()
    }
}

// MARK: volume
extension NoisePlayer {
    func setVolume(_ volume: Double) {
        currentVolume = Float(volume)
    }
}
