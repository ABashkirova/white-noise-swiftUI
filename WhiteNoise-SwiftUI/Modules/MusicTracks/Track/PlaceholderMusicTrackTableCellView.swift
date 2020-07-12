//
//  PlaceholderMusicTrackTableCellView.swift
//  WhiteNoise-SwiftUI
//
//  Created by Александра Башкирова on 11.07.2020.
//  Copyright © 2020 Alexandra Bashkirova. All rights reserved.
//

import SwiftUI

struct PlaceholderMusicTrackTableCellView: View {
    
    static let linearGradient = LinearGradient(
        gradient: .init(colors: [Color.graySilver, Color.grayGainsboro]),
        startPoint: .init(x: 0.25, y: 0.1),
        endPoint: .init(x: 0.5, y: 0.6)
    )
    
    var body: some View {
        HStack() {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Self.linearGradient)
                .frame(height: 100)
                .aspectRatio(1, contentMode: .fit)
            GeometryReader { geometry in
                VStack(alignment: .leading, spacing: 12.0) {
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .fill(Color.graySilver)
                        .frame(width: geometry.size.width * 0.9, height: 14.0)
                    VStack(alignment: .leading, spacing: 2.0) {
                        RoundedRectangle(cornerRadius: 6, style: .continuous)
                            .fill(Color.grayGainsboro)
                            .frame(width: geometry.size.width * 0.8, height: 10.0)
                        RoundedRectangle(cornerRadius: 6, style: .continuous)
                            .fill(Color.grayGainsboro)
                            .frame(width: geometry.size.width * 0.4, height: 10.0)
                    }
                }
            }
        }
        .foregroundColor(.clear)
    }
}

#if DEBUG
struct PlaceholderMusicTrackTableCellView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceholderMusicTrackTableCellView()
        .previewLayout(.fixed(width: 300, height: 100))
    }
}
#endif
