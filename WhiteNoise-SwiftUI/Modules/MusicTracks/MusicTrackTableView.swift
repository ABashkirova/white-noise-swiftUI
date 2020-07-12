//
//  MusicTrackTableView.swift
//  WhiteNoise-SwiftUI
//
//  Created by Александра Башкирова on 28.06.2020.
//  Copyright © 2020 Alexandra Bashkirova. All rights reserved.
//

import SwiftUI

struct MusicTrackTableView: View {
    @ObservedObject var viewModel: MusicTracksTableViewModel

    init(viewModel: MusicTracksTableViewModel) {
        self.viewModel = viewModel
        UITableView.appearance().showsVerticalScrollIndicator = false
        UITableViewCell.appearance().selectionStyle = .none
        UITableViewCell.appearance().backgroundColor = .clear
        UITableView.appearance().backgroundColor = .clear
    }

    var body: some View {
        createTrackList()
    }
    
    func createTrackList() -> some View {
        guard let trackViewModels = viewModel.trackViewModels else {
            return AnyView(PlaceholderMusicTrackTableCellView())
        }
        
        return AnyView(
            List() {
                ForEach(trackViewModels) { audio in
                    MusicTrackTableCellView(viewModel: audio)
                        .padding(.vertical, 8.0)
                }
            }
            
        )
    }
}

#if DEBUG
struct MusicTrackTableView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MusicTrackTableView(
                viewModel: MusicTracksTableViewModel(
                    category: CategoryRepositoryImpl().getCategory(by: "Other")!,
                    musicTrackViewModelFactory: MusicTracksFactory()))
            MusicTrackTableView(
            viewModel: MusicTracksTableViewModel(
                category: nil,
                musicTrackViewModelFactory: MusicTracksFactory()))
        }
        .previewLayout(.fixed(width: 300, height: 350))
    }
}
#endif
