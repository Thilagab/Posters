//
//  URLImage.swift
//  Posters
//
//  Created by Thilagawathy Duraisamy on 4/4/2024.
//

import SwiftUI
// comments: // 1. Import SwiftUI for building the user interface.
// 2. Import Combine for reactive programming and data binding.

struct URLImage: View {
    
    let url: String
    let placeholder: String
    
    @ObservedObject var imageLoader = ImageLoader()
    
    init(url: String, placeholder: String = "placeholder") {
        self.url = url
        self.placeholder = placeholder
        self.imageLoader.downloadImage(url: url)
    }
    
    var body: some View {
        
        if let image = imageLoader.image {
            Image(uiImage: image).resizable()
        } else {
           Image(systemName: "photo.artframe.circle.fill")
        }
    }
}

#Preview {
    URLImage(url: "https://fyrafix.files.wordpress.com/2011/08/url-8.jpg")
}

