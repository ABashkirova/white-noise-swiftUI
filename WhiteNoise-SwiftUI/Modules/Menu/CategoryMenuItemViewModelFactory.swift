//
//  CategoryMenuItemViewModelFactory.swift
//  WhiteNoise-SwiftUI
//
//  Created by Александра Башкирова on 11.07.2020.
//  Copyright © 2020 Alexandra Bashkirova. All rights reserved.
//

import Foundation

class CategoryMenuFactory {
}

extension CategoryMenuFactory: CategoryMenuItemViewModelFactory {
    func createCategoryMenuItemViewModels(categories: [CategoryData]) -> [CategoryMenuItemViewModel] {
        if !categories.isEmpty {
            return categories.map { category in
                return createCategoryMenuItemViewModel(category)
            }
        } else {
            return (0...5).map { _ in
                createCategoryMenuItemViewModel(nil)
            }
        }
    }
    
    private func createCategoryMenuItemViewModel(_ category: CategoryData?) -> CategoryMenuItemViewModel {
        return CategoryMenuItemViewModel(category)
    }
}

protocol CategoryMenuItemViewModelFactory {
    func createCategoryMenuItemViewModels(categories: [CategoryData]) -> [CategoryMenuItemViewModel]
}


