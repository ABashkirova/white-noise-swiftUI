//
//  CategoryRepositoryImpl.swift
//  WhiteNoise-SwiftUI
//
//  Created by Александра Башкирова on 05.07.2020.
//  Copyright © 2020 Alexandra Bashkirova. All rights reserved.
//

import Foundation

class CategoryRepositoryImpl: CategoryRepository {
    func getCategories() -> [CategoryData] {
        return categories
    }

    func getCategory(by name: String) -> CategoryData? {
        return categories.first { category in
            category.title == name
        }
    }
}

class CategoryRepositoryEmptyImpl: CategoryRepository {
    func getCategories() -> [CategoryData] {
        return []
    }

    func getCategory(by name: String) -> CategoryData? {
        return nil
    }
}

let categories: [CategoryData] = [
    CategoryData(
    title: "Natural",
    tag: "Beauty of the mother's presence",
    image: "cover_natural",
    info: "A collection of white noise from nature, containing four audio files.",
    audioList: [
        AudioData(
                name: "Silence of Stones",
                audioLength: 56,
                audioImage: "natural_01"),
        AudioData(
                name: "Wind Blowing",
                audioLength: 59,
                audioImage: "natural_02"),
        AudioData(
                name: "Lonely Mother of all",
                audioLength: 95,
                audioImage: "natural_03"),
        AudioData(
                name: "Windy Beach",
                audioLength: 59,
                audioImage: "natural_04"),
        AudioData(
                name: "Tree Frog Sound",
                audioLength: 62,
                audioImage: "natural_05")
    ]),
    CategoryData(
            title: "Rain",
            tag: "Immersed in the Rain",
            image: "cover_rain",
            info: "A collection of white noise from nature, containing some audio files.",
            audioList: [
                AudioData(
                        name: "Rainy Mood",
                        audioLength: 63,
                        audioImage: "rain_01"),
                AudioData(
                        name: "Relaxing Rain Noise",
                        audioLength: 38,
                        audioImage: "rain_02"),
                AudioData(
                        name: "Close Thunder with Rain",
                        audioLength: 16,
                        audioImage: "rain_03")
            ]),
    CategoryData(
            title: "Forest",
            tag: "Being in the magical forest",
            image: "cover_forest",
            info: "A collection of white noise from nature, containing four audio files.",
            audioList: [
                AudioData(
                        name: "Spring Forest",
                        audioLength: 44,
                        audioImage: "forest_01"),
                AudioData(
                        name: "Forest Sounds",
                        audioLength: 52,
                        audioImage: "forest_02"),
                AudioData(
                        name: "Melody of Birds",
                        audioLength: 76,
                        audioImage: "forest_03"),
                AudioData(
                        name: "Soothing Nighttime Ambience",
                        audioLength: 152,
                        audioImage: "forest_04")
            ]),
    CategoryData(
            title: "Flow",
            tag: "Flow of max Postivity",
            image: "cover_flow",
            info: "A collection of white noise from nature, containing some audio files.",
            audioList: [
                AudioData(
                        name: "Go with the Flow",
                        audioLength: 48,
                        audioImage: "flow_01"),
                AudioData(
                        name: "Walking in shallow water",
                        audioLength: 14,
                        audioImage: "flow_02"),
                AudioData(
                        name: "Mountain river",
                        audioLength: 140,
                        audioImage: "flow_03"),
                AudioData(
                        name: "Waves crashing",
                        audioLength: 149,
                        audioImage: "flow_04")
            ]),
    CategoryData(
            title: "Other",
            tag: "As your heart says",
            image: "cover_other",
            info: "A collection of white noise from nature, containing some audio files.",
            audioList: [
                AudioData(
                    name: "Wind Blowing",
                    audioLength: 59,
                    audioImage: "other_01"),
                AudioData(
                    name: "Fire",
                    audioLength: 26,
                    audioImage: "other_02"),
                AudioData(
                    name: "White noise",
                    audioLength: 30,
                    audioImage: "other_03"),
                AudioData(
                    name: "Tin Can Wind Chimes Sounds",
                    audioLength: 361,
                    audioImage: "other_04")
            ])
]
