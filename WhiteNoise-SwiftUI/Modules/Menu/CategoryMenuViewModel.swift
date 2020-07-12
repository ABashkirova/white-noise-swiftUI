//
//  CategoryMenuViewModel.swift
//  WhiteNoise-SwiftUI
//
//  Created by Александра Башкирова on 04.07.2020.
//  Copyright © 2020 Alexandra Bashkirova. All rights reserved.
//

import Foundation
import Combine

protocol CategoryMenuDelegate: class {
    func didSelect(category: CategoryData)
}

class CategoryMenuViewModel: ObservableObject {
    private var currentActive: CategoryData?
    var categoryViewModels: [CategoryMenuItemViewModel]
    
    weak var delegate: CategoryMenuDelegate?
    
    init(
        categories: [CategoryData],
        categoryMenuItemViewModelFactory: CategoryMenuItemViewModelFactory
    ) {
        categoryViewModels = categoryMenuItemViewModelFactory.createCategoryMenuItemViewModels(categories: categories)
    }
    
    func setActiveCategory(category: CategoryData?) {
        guard let category = category else { return }
        delegate?.didSelect(category: category)
        if let currentActive = currentActive {
            if currentActive.title != category.title {
                toggleSelectedIndicator(category: currentActive)
            } else {
                return
            }
        }
        self.currentActive = category
        toggleSelectedIndicator(category: category)
    }
    
    private func toggleSelectedIndicator(category: CategoryData) {
        categoryViewModels.first(where: { $0.category?.title == category.title })?.isSelected.toggle()
    }
}
