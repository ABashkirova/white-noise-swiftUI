//
//  PlaceholderCategoryCardView.swift
//  WhiteNoise-SwiftUI
//
//  Created by Александра Башкирова on 11.07.2020.
//  Copyright © 2020 Alexandra Bashkirova. All rights reserved.
//

import SwiftUI

struct PlaceholderCategoryCardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
           Image("CardPlaceholder")
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
            .foregroundColor(.clear)
            .shadow(radius: 10)
        }
        .padding(.trailing, 64.0)
    }
}

#if DEBUG
struct PlaceholderCategoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceholderCategoryCardView()
    }
}
#endif
