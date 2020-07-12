//
//  MainScreenViewsFactory.swift
//  WhiteNoise-SwiftUI
//
//  Created by Александра Башкирова on 11.07.2020.
//  Copyright © 2020 Alexandra Bashkirova. All rights reserved.
//

import SwiftUI

struct MainScreenViewsFactory {
    private let menuViewModel: CategoryMenuViewModel
    private let playerViewModel: PlayerViewModel
    private let musicTrackTableViewModel: MusicTracksTableViewModel
    private let categoryCardViewModel: CategoryCardViewModel
    
    init(
        menuViewModel: CategoryMenuViewModel,
        playerViewModel: PlayerViewModel,
        musicTrackTableViewModel: MusicTracksTableViewModel,
        categoryCardViewModel: CategoryCardViewModel
    ) {
        self.menuViewModel = menuViewModel
        self.playerViewModel = playerViewModel
        self.musicTrackTableViewModel = musicTrackTableViewModel
        self.categoryCardViewModel = categoryCardViewModel
    }
    
    func createMenuView() -> some View {
        return CategoryMenuView(viewModel: menuViewModel)
    }
    
    func createSplitView() -> some View {
        return Rectangle()
            .frame(width: 1.0)
            .foregroundColor(Color.grayGainsboro)
    }
    
    func createPlayer() -> some View {
        return PlayerView(viewModel: playerViewModel)
    }
    
    func createTrackTableView() -> some View {
        return MusicTrackTableView(viewModel: musicTrackTableViewModel)
    }
    
    func createCardView() -> some View {
        return CategoryCardView(viewModel: categoryCardViewModel)
    }
    
    func createNameAppView() -> some View {
        return Text("White noise")
            .font(.system(size: 16.0, weight: .medium, design: .rounded))
            .foregroundColor(.gray)
    }
}
