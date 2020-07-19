//
//  PlayerView.swift
//  WhiteNoise-SwiftUI
//
//  Created by Александра Башкирова on 28.06.2020.
//  Copyright © 2020 Alexandra Bashkirova. All rights reserved.
//

import SwiftUI

struct PlayerView: View {
    @ObservedObject var viewModel: PlayerViewModel
    private var volume: Double
    
    init(viewModel: PlayerViewModel) {
        self.viewModel = viewModel
        self.volume = viewModel.volume
    }
    
    var volumeSlider: some View {
        Slider(
            value: Binding(get: {
                self.viewModel.volume
            }, set: { (newVal) in
                self.viewModel.volume = newVal
                self.volumeChanged()
            }),
            in: 0...1,
            step: 0.01)
    }

    var body: some View {
        HStack(spacing: 12.0) {
            Button(action: {
                self.playTapped()
            }) {
                viewModel.isPlayed ? Image("Pause") : Image("Play")
            }
            volumeSlider
        }
        .foregroundColor(.clear)
    }
    
    func playTapped() {
        viewModel.playChange()
    }
    
    func volumeChanged() {
        viewModel.volumeChanged()
    }
}

#if DEBUG
struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlayerView(viewModel: PlayerViewModel(volume: 1.0, isPlayed: true))
            PlayerView(viewModel: PlayerViewModel(volume: 0.5, isPlayed: false))
        }
        .previewLayout(.fixed(width: 300, height: 100))
    }
}
#endif
