//
//  PlayerViewModel.swift
//  WhiteNoise-SwiftUI
//
//  Created by Александра Башкирова on 12.07.2020.
//  Copyright © 2020 Alexandra Bashkirova. All rights reserved.
//

import Foundation

protocol PlayerDelegate: class {
    func stop()
    func play()
    func setVolume(_ volume: Double)
}

class PlayerViewModel: ObservableObject {
    weak var delegate: PlayerDelegate?
    @Published var isPlayed: Bool
    @Published var volume: Double
    
    init(volume: Double, isPlayed: Bool = false) {
        self.volume = volume
        self.isPlayed = isPlayed
    }
    
    func playChange() {
        isPlayed.toggle()
        isPlayed ? delegate?.play() : delegate?.stop()
    }
    
    func volumeChanged() {
        delegate?.setVolume(volume)
    }
}
