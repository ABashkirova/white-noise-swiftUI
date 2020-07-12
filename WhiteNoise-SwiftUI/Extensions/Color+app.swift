//
//  Color+app.swift
//  WhiteNoise-SwiftUI
//
//  Created by Александра Башкирова on 11.07.2020.
//  Copyright © 2020 Alexandra Bashkirova. All rights reserved.
//

import SwiftUI

extension Color {
    static let graySilver = Color(red: 193.0 / 255, green: 193.0 / 255, blue: 193.0 / 255)
    static let grayGainsboro = Color(red: 221.0 / 255, green: 221.0 / 255, blue: 221.0 / 255)
}

#if DEBUG
struct Colorapp_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Rectangle().fill(Color.gray)
            Rectangle().fill(Color.graySilver)
            Rectangle().fill(Color.grayGainsboro)
        }
        .previewLayout(.fixed(width: 50, height: 50))
    }
}
#endif
