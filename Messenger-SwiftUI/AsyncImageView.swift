//
//  AsyncImageView.swift
//  FormIOS
//
//  Created by Shahrukh on 08/09/2023.
//

import SwiftUI

struct AsyncImageView<Content, Placeholder>: View where Content: View, Placeholder: View {
    
    private let imageUrl: String
    private var content: (Image) -> Content
    private var placeholder: () -> Placeholder
    
    @StateObject private var imageLoader = ImageLoader()

    init(url: String, @ViewBuilder content: @escaping (Image) -> Content, @ViewBuilder placeholder: @escaping () -> Placeholder) {
        self.imageUrl = url
        self.content = content
        self.placeholder = placeholder
    }
        
    var body: some View {
        VStack {
            if let image = imageLoader.downloadedImage {
                content(Image(uiImage: image))
            } else {
                placeholder()
                    .onAppear {
                        imageLoader.loadImage(imageUrl: imageUrl)
                    }
            }
        }
    }
}

struct AsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageView (
            url: "https://www.google.com/images/branding/googlelogo/2x/googlelogo_light_color_92x30dp.png"
        ) { image in
            
        } placeholder: {
            
        }
    }
}
