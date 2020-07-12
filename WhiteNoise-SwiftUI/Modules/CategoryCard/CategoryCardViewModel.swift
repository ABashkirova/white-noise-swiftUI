//
//  CategoryCardViewModel.swift
//  WhiteNoise-SwiftUI
//
//  Created by Александра Башкирова on 05.07.2020.
//  Copyright © 2020 Alexandra Bashkirova. All rights reserved.
//

import Foundation

class CategoryCardViewModel: ObservableObject {
    var category: CategoryData?
    @Published var title: String?
    @Published var description: String?
    @Published var numberAudio: String?
    @Published var imageName: String?

    init(category: CategoryData?) {
        self.category = category
        if let category = category {
            update(category: category)
        }
    }
    
    func update(category: CategoryData) {
        self.category = category
        self.title = "\(category.title) collection"
        self.description = category.tag
        self.imageName = category.image
        let count = category.audioList.count
        self.numberAudio = count < 10 ? "0\(count)" : "\(count)"
    }
}
