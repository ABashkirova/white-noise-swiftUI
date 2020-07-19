//
//  NoisePlayer.swift
//  WhiteNoise-SwiftUI
//
//  Created by Александра Башкирова on 18.07.2020.
//  Copyright © 2020 Alexandra Bashkirova. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit
import MediaPlayer

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
        makeActiveAudioSession()
        player?.play()
        setupRemoteTransportControls()
    }

    func stop() {
        player?.pause()
        do {
            try AVAudioSession.sharedInstance().setActive(false)
        } catch {
            print("Error setting audio session active=false")
        }
    }
}

// MARK: volume
extension NoisePlayer {
    func setVolume(_ volume: Double) {
        currentVolume = Float(volume)
    }
}

// MARK: sharing player
extension NoisePlayer {
    private func makeActiveAudioSession() {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(AVAudioSession.Category.playback)
            try audioSession.setActive(true)
        } catch {
            print("Failed to set audio session category.  Error: \(error)")
        }
    }
    
    private func setupRemoteTransportControls() {
        UIApplication.shared.beginReceivingRemoteControlEvents()
        let commandCenter = MPRemoteCommandCenter.shared()
        weak var weakSelf = self
        commandCenter.pauseCommand.addTarget { (event) -> MPRemoteCommandHandlerStatus in
            weakSelf?.stop()
            return .success
        }
       
        commandCenter.playCommand.addTarget { (event) -> MPRemoteCommandHandlerStatus in
            weakSelf?.play()
            return .success
        }
        setupNowPlaying()
    }
    
    private func setupNowPlaying() {
        if
            let currentAudio = currentAudio,
            let image = UIImage(named: currentAudio.audioImage)
        {
            let artwork = MPMediaItemArtwork
                .init(boundsSize: image.size,
                      requestHandler: { (size) -> UIImage in return image})
            
            let nowPlayingInfo = [MPMediaItemPropertyTitle : currentAudio.name,
                                  MPMediaItemPropertyArtwork : artwork]
                                        as [String : Any]
            MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
        }
    }
}
