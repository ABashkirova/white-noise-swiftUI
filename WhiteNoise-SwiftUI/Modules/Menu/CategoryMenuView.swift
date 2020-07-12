//
//  CategoryMenuView.swift
//  WhiteNoise-SwiftUI
//
//  Created by Александра Башкирова on 28.06.2020.
//  Copyright © 2020 Alexandra Bashkirova. All rights reserved.
//

import SwiftUI
import Combine

struct CategoryMenuView: View {
    @ObservedObject var viewModel: CategoryMenuViewModel
    
    init(viewModel: CategoryMenuViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Button(action: {
                self.clickOnMenuButton()
            }) {
                Image("Menu")
                    .renderingMode(.original)
                    .foregroundColor(.clear)
            }
            .frame(width: 40.0, height: 40.0)

            ScrollView(showsIndicators: false) {
                ForEach(viewModel.categoryViewModels) { categoryViewModel in
                    Button(action: {
                        self.clickOnCategory(category: categoryViewModel.category)
                    }) {
                        TextMenuItem(viewModel: categoryViewModel)
                    }
                    .padding(.vertical, 40)
                }
            }
        }
        .frame(width: 56.0)
    }

    func clickOnCategory(category: CategoryData?) {
        guard let category = category else { return }
        
        viewModel.setActiveCategory(category: category)
    }

    func clickOnMenuButton() {
        print("Click on Menu")
    }
}

#if DEBUG
struct CategoryMenuView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CategoryMenuView(
                viewModel: CategoryMenuViewModel(
                    categories: CategoryRepositoryImpl().getCategories(),
                    categoryMenuItemViewModelFactory: CategoryMenuFactory()
                )
            )
            CategoryMenuView(
                viewModel: CategoryMenuViewModel(
                    categories: [],
                    categoryMenuItemViewModelFactory: CategoryMenuFactory()
                )
            )
        }
    }
}
#endif
