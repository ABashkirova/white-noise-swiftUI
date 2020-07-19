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
    var currentAudio: AudioData?
    var isPlaying: Bool {
        player?.isPlaying ?? false
    }
    
    func setAudio(_ audio: AudioData) {
        currentAudio = audio
        player = makePlayer(audioTrack: audio)
    }
    
    func play() {
        player?.play()
    }
    
    func pause() {
        player?.pause()
    }
    
    private func makePlayer(audioTrack: AudioData) -> AVAudioPlayer? {
        let url = Bundle.main.url(
            forResource: audioTrack.name,
            withExtension: "mp3")!
        let player = try? AVAudioPlayer(contentsOf: url)
        player?.numberOfLoops = -1
        return player
    }
}
