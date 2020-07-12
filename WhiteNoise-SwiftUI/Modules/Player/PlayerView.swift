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
    @State private var volume: Double = 5
    
    init(viewModel: PlayerViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack(spacing: 12.0) {
            Button(action: {
                self.playTapped()
            }) {
                viewModel.isPlayed ? Image("Pause") : Image("Play")
            }
            Slider(value: $volume, in: 0...10, step: 0.1)
            Button(action: {
                self.shaffleTapped()
            }) {
                Image("Shuffle")
                    .renderingMode(.original)
            }
        }
        .foregroundColor(.clear)
    }
    
    func playTapped() {
        viewModel.playChange()
    }
    
    func shaffleTapped() {
        print("Shaffle tapped")
    }
}

#if DEBUG
struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlayerView(viewModel: PlayerViewModel(isPlayed: true))
            PlayerView(viewModel: PlayerViewModel(isPlayed: false))
        }
        .previewLayout(.fixed(width: 300, height: 100))
    }
}
#endif
