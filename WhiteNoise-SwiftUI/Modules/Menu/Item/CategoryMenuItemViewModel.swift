//
//  CategoryMenuItemViewModel.swift
//  WhiteNoise-SwiftUI
//
//  Created by Александра Башкирова on 05.07.2020.
//  Copyright © 2020 Alexandra Bashkirova. All rights reserved.
//

import Foundation

class CategoryMenuItemViewModel: ObservableObject, Identifiable {
    let id = UUID()
    
    var category: CategoryData?
    @Published var isSelected: Bool

    init(_ category: CategoryData?, _ isSelected: Bool = false) {
        self.category = category
        self.isSelected = isSelected
    }
}
