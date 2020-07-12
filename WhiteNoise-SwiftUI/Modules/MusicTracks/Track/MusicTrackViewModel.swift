//
//  MusicTrackViewModel.swift
//  WhiteNoise-SwiftUI
//
//  Created by Александра Башкирова on 05.07.2020.
//  Copyright © 2020 Alexandra Bashkirova. All rights reserved.
//

import Foundation

protocol MusicTrackDelegate: class {
    func didSelect(audioTrack: AudioData, isPlayed: Bool)
}

class MusicTrackViewModel: ObservableObject, Identifiable {
    let id = UUID()
    let audio: AudioData?

    weak var delegate: MusicTrackDelegate?
    
    @Published var title: String?
    @Published var imageName: String?
    @Published var length: String?
    @Published var isPlayed: Bool

    init(_ audioData: AudioData?, _ isPlayed: Bool = false) {
        self.audio = audioData
        self.title = audioData?.name
        self.imageName = audioData?.audioImage
        self.length = audioData?.audioLength.toDateBrief() ?? ""
        self.isPlayed = isPlayed
    }
    
    func trackSelected(_ audioTrack: AudioData) {
        self.isPlayed.toggle()
        delegate?.didSelect(audioTrack: audioTrack, isPlayed: isPlayed)
    }
}
