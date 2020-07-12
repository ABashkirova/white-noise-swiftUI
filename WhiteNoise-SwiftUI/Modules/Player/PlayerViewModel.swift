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
}

class PlayerViewModel: ObservableObject {
    weak var delegate: PlayerDelegate?
    @Published var isPlayed: Bool
    
    init(isPlayed: Bool = false) {
        self.isPlayed = isPlayed
    }
    
    func playChange() {
        isPlayed.toggle()
        isPlayed ? delegate?.play() : delegate?.stop()
    }
}
