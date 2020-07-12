//
//  Configurator.swift
//  WhiteNoise-SwiftUI
//
//  Created by Александра Башкирова on 05.07.2020.
//  Copyright © 2020 Alexandra Bashkirova. All rights reserved.
//

import SwiftUI

class Configurator {
    private let categoryRepository: CategoryRepository
    
    init() {
       categoryRepository = CategoryRepositoryImpl()
    }

    func configure() -> UIViewController {
        let mainScreenViewModel = MainScreenViewModel(
            categoryRepository: categoryRepository,
            categoryMenuItemViewModelFactory: CategoryMenuFactory(),
            musicTrackViewModelFactory: MusicTracksFactory()
        )
        let contentView = MainScreenView(viewModel: mainScreenViewModel)
        return UIHostingController(rootView: contentView)
    }
}
