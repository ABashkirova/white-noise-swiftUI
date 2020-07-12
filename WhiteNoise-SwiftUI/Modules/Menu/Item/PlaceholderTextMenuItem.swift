//
//  PlaceholderTextMenuItem.swift
//  WhiteNoise-SwiftUI
//
//  Created by Александра Башкирова on 11.07.2020.
//  Copyright © 2020 Alexandra Bashkirova. All rights reserved.
//

import SwiftUI

struct PlaceholderTextMenuItem: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10, style: .continuous)
            .fill(Color.grayGainsboro)
            .frame(width: 10.0, height: 80.0)
            .padding()
    }
}

#if DEBUG
struct PlaceholderTextMenuItem_Previews: PreviewProvider {
    static var previews: some View {
        PlaceholderTextMenuItem()
        .previewLayout(.fixed(width: 60, height: 100))
    }
}
#endif
