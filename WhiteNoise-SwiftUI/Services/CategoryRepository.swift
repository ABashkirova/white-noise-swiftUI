//
//  CategoryRepository.swift
//  WhiteNoise-SwiftUI
//
//  Created by Александра Башкирова on 05.07.2020.
//  Copyright © 2020 Alexandra Bashkirova. All rights reserved.
//

import Foundation

protocol CategoryRepository {
    func getCategories() -> [CategoryData]
    func getCategory(by name: String) -> CategoryData?
}
