//
//  TextMenuItem.swift
//  WhiteNoise-SwiftUI
//
//  Created by Александра Башкирова on 04.07.2020.
//  Copyright © 2020 Alexandra Bashkirova. All rights reserved.
//

import SwiftUI

struct TextMenuItem: View {
    @ObservedObject var viewModel: CategoryMenuItemViewModel

    init(viewModel: CategoryMenuItemViewModel) {
        self.viewModel = viewModel
    }
    
    var placeholder: some View {
        PlaceholderTextMenuItem()
    }
    
    var circle: some View {
        Circle()
            .frame(width: 8.0, height: 8.0)
            .foregroundColor(.blue)
    }
    
    var body: some View {
        if let title = viewModel.category?.title {
            return AnyView(
                createMenuItem(title: title, isSelected: viewModel.isSelected)
            )
        } else {
            return AnyView(self.placeholder)
        }
    }
    
    private func createMenuItem(title: String, isSelected: Bool) -> some View {
        VStack(spacing: 4.0) {
            Text(title.uppercased())
                .font(.system(size: 12.0, weight: .regular, design: .rounded))
                .foregroundColor(isSelected ? .gray : .graySilver)
                .lineLimit(1)
                .multilineTextAlignment(.leading)
                .rotationEffect(.degrees(-90))
                .frame(width: heightOf(text: title) * 4, height: widthOf(text: title) * 1.5)
            isSelected ? AnyView(self.circle) : AnyView(self.circle.hidden())
        }
    }
    
    private func widthOf(text: String) -> CGFloat {
        return text.widthOfString(
            usingFont: UIFont.systemFont(ofSize: 12, weight: .regular))
    }
    
    private func heightOf(text: String) -> CGFloat {
        return text.heightOfString(
            usingFont: UIFont.systemFont(ofSize: 12, weight: .regular))
    }
}

#if DEBUG
struct TextMenuItem_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TextMenuItem(
                viewModel: CategoryMenuItemViewModel(
                    CategoryData(
                        title: "Forest",
                        tag: "",
                        image: "",
                        info: "",
                        audioList: []),
                    true)
            )
            TextMenuItem(
                viewModel: CategoryMenuItemViewModel(
                    CategoryData(
                        title: "Natural",
                        tag: "",
                        image: "",
                        info: "",
                        audioList: []))
            )
            TextMenuItem(
                viewModel: CategoryMenuItemViewModel(nil)
            )
        }
        .previewLayout(.fixed(width: 60, height: 100))
    }
}
#endif
