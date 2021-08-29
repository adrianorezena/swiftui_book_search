//
//  EnvironmentValues+ImageCache.swift
//  Book Search
//
//  Created by Adriano Rezena on 29/08/21.
//

import SwiftUI


struct ImageCacheKey: EnvironmentKey {
    static let defaultValue: ImageCache = TemporaryImageCache()
}

extension EnvironmentValues {
    var imageCache: ImageCache {
        get { self[ImageCacheKey.self] }
        set { self[ImageCacheKey.self] = newValue }
    }
}
