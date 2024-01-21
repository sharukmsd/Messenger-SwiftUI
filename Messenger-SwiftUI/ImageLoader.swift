//
//  ImageLoader.swift
//  FormIOS
//
//  Created by Shahrukh on 08/09/2023.
//

import SwiftUI

class ImageLoader: ObservableObject {
    @Published var downloadedImage: UIImage? = nil
    
    func loadImage(imageUrl: String) {
        if let cachedImage = ImageCache.shared.getImage(forKey: imageUrl) {
            self.downloadedImage = cachedImage
        } else {
            guard let url = URL(string: imageUrl) else { return }
            URLSession.shared.dataTask(with: url) { data, _, error in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.downloadedImage = image
                        ImageCache.shared.setImage(image, forKey: imageUrl)
                    }
                } else {
                    print("Failed to load image: \(error?.localizedDescription ?? "Unknown error")")
                }
            }.resume()
        }
    }
}
