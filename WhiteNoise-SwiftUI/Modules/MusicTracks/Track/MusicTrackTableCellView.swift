//
//  MusicTrackTableCellView.swift
//  WhiteNoise-SwiftUI
//
//  Created by Александра Башкирова on 05.07.2020.
//  Copyright © 2020 Alexandra Bashkirova. All rights reserved.
//

import SwiftUI

struct MusicTrackTableCellView: View {
    @ObservedObject var viewModel: MusicTrackViewModel

    init(viewModel: MusicTrackViewModel) {
        self.viewModel = viewModel
    }
    
    var placeholder: some View {
        PlaceholderMusicTrackTableCellView()
    }
    
    var body: some View {
        if
            let audio = viewModel.audio,
            let image = viewModel.imageName,
            let title = viewModel.title,
            let length = viewModel.length
        {
            return AnyView(
                createMusicTrack(
                    audioTrack: audio,
                    imageName: image,
                    audioTitle: title,
                    audioLength: length,
                    isPlayed: viewModel.isPlayed)
            )
        } else {
            return AnyView(self.placeholder)
        }
    }
    
    private func createMusicTrack(
        audioTrack: AudioData,
        imageName: String,
        audioTitle: String,
        audioLength: String,
        isPlayed: Bool
    ) -> some View {
        HStack {
            ZStack {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(12)
                Button(action: {
                    self.trackTapped(audioTrack: audioTrack)
                }) {
                    if (isPlayed) {
                        Image("Music Playing")
                            .renderingMode(.original)
                    }
                }
            }
            .frame(height: 60)
            .shadow(radius: 6)
            .aspectRatio(1, contentMode: .fit)
            
            VStack(alignment: .leading, spacing: 6.0) {
                Text(audioTitle)
                    .font(.system(size: 16.0, weight: .regular, design: .rounded))
                    .foregroundColor(.gray)
                    .lineLimit(nil)
                Text(audioLength)
                    .font(.system(size: 12.0, weight: .regular, design: .rounded))
                    .foregroundColor(.graySilver)
                    .lineLimit(nil)
            }
        }
        .foregroundColor(.clear)
    }

    private func trackTapped(audioTrack: AudioData) {
        viewModel.trackSelected(audioTrack)
    }
}

#if DEBUG
struct MusicTrackTableCellView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MusicTrackTableCellView(
                viewModel: MusicTrackViewModel(
                    AudioData(
                        name: "Melody of Birds",
                        audioLength: 72,
                        audioImage: "rain_03")
                )
            )
            MusicTrackTableCellView(
                viewModel: MusicTrackViewModel(
                    AudioData(
                        name: "Melody of Birds",
                        audioLength: 72,
                        audioImage: "rain_03"),
                    true
                )
            )
            MusicTrackTableCellView(
                viewModel: MusicTrackViewModel(nil)
            )
        }.previewLayout(.fixed(width: 300, height: 100))
    }
}
#endif
