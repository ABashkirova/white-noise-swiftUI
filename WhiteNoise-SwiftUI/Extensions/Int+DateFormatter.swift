//
//  Int+DateFormatter.swift
//  WhiteNoise-SwiftUI
//
//  Created by Александра Башкирова on 11.07.2020.
//  Copyright © 2020 Alexandra Bashkirova. All rights reserved.
//

import Foundation

extension Int {
    func toDateBrief() -> String? {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .brief
        return formatter.string(from: Double(self))
    }
}
