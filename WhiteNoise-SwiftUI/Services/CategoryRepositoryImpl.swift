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
                audioLength: 72,
                audioImage: "natural_01"),
        AudioData(
                name: "Shine like Aurora",
                audioLength: 104,
                audioImage: "natural_02"),
        AudioData(
                name: "Lonely Mother of all",
                audioLength: 72,
                audioImage: "natural_03"),
        AudioData(
                name: "Chill the Mood",
                audioLength: 104,
                audioImage: "natural_04"),
        AudioData(
                name: "Cave calling",
                audioLength: 104,
                audioImage: "natural_05")
    ]),
    CategoryData(
            title: "Rain",
            tag: "Immersed in the Rain",
            image: "cover_rain",
            info: "A collection of white noise from nature, containing some audio files.",
            audioList: [
                AudioData(
                        name: "Ripples my Heart",
                        audioLength: 72,
                        audioImage: "rain_01"),
                AudioData(
                        name: "The cry of Insects",
                        audioLength: 104,
                        audioImage: "rain_02"),
                AudioData(
                        name: "Tears of Joy",
                        audioLength: 72,
                        audioImage: "rain_03")
            ]),
    CategoryData(
            title: "Forest",
            tag: "Being in the magical forest",
            image: "cover_forest",
            info: "A collection of white noise from nature, containing four audio files.",
            audioList: [
                AudioData(
                        name: "Sound of Wind",
                        audioLength: 72,
                        audioImage: "forest_01"),
                AudioData(
                        name: "The cry of Insects",
                        audioLength: 104,
                        audioImage: "forest_02"),
                AudioData(
                        name: "Melody of Birds",
                        audioLength: 72,
                        audioImage: "forest_03"),
                AudioData(
                        name: "Melody of Bear",
                        audioLength: 72,
                        audioImage: "forest_04")
            ]),
    CategoryData(
            title: "Flow",
            tag: "Flow of max Postivity",
            image: "cover_flow",
            info: "A collection of white noise from nature, containing some audio files.",
            audioList: [
                AudioData(
                        name: "Sound of Water",
                        audioLength: 72,
                        audioImage: "flow_01"),
                AudioData(
                        name: "Go with the Flow",
                        audioLength: 104,
                        audioImage: "flow_02"),
                AudioData(
                        name: "Melting my Heart",
                        audioLength: 72,
                        audioImage: "flow_03"),
                AudioData(
                        name: "Sound of Pebbles",
                        audioLength: 104,
                        audioImage: "flow_04")
            ]),
    CategoryData(
            title: "Other",
            tag: "As your heart says",
            image: "cover_other",
            info: "A collection of white noise from nature, containing some audio files.",
            audioList: [
                AudioData(
                        name: "Sound of Wind",
                        audioLength: 72,
                        audioImage: "other_01"),
                AudioData(
                        name: "The cry of Insects",
                        audioLength: 104,
                        audioImage: "other_02"),
                AudioData(
                        name: "Melody of Birds",
                        audioLength: 72,
                        audioImage: "other_03")
            ])
]
