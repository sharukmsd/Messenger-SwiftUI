//
//  ImageCache.swift
//  iDonate
//
//  Created by Shahrukh on 12/10/2023.
//

import Foundation
import UIKit

class ImageCache {
    
    static let shared = ImageCache(cacheLimitGB: 1)
    private var cache = NSCache<NSString, UIImage>()
    private var keys: [NSString] = []
    private let cacheLimit: Int // The size limit in bytes
    private var currentCacheSize: Int = 0

    init(cacheLimitGB: Int) {
        self.cacheLimit = cacheLimitGB * 1024 * 1024 * 1024
    }

    func getImage(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }

    func setImage(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
        keys.append(key as NSString)
        let imageSizeInBytes = calculateImageSize(image)
        currentCacheSize += imageSizeInBytes
        purgeCacheIfNeeded()
    }

    private func calculateImageSize(_ image: UIImage) -> Int {
        guard let cgImage = image.cgImage else {
            return 0
        }
        let bitsPerComponent = cgImage.bitsPerComponent
        let bytesPerPixel = (bitsPerComponent * cgImage.bitsPerPixel) / 8
        let totalBytes = cgImage.width * cgImage.height * bytesPerPixel
        return totalBytes
    }

    private func purgeCacheIfNeeded() {
        while currentCacheSize > cacheLimit {
            if let keyToRemove = keys.first {
                if let removedImage = cache.object(forKey: keyToRemove) {
                    let imageSizeInBytes = calculateImageSize(removedImage)
                    currentCacheSize -= imageSizeInBytes
                    keys.removeFirst()
                    cache.removeObject(forKey: keyToRemove)
                }
            }
        }
    }
}
