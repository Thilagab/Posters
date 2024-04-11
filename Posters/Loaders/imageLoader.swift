//
//  imageLoader.swift
//  Posters
//
//  Created by Thilagawathy Duraisamy on 4/4/2024.
//

import Foundation
import UIKit

class ImageLoader: ObservableObject {
    
    @Published var image: UIImage?
    
    func downloadImage(url: String) {
        
        guard let imageUrl = URL(string: url) else {
            return
        }
        
        Task {
            URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
                
                guard let httpUrlResponse = response else {
                    fatalError("OMDB API return response: \(response.debugDescription)")
                }
                
                guard let dataImage = data, error == nil else {
                    print("Image couldnt download from API call: \(error.debugDescription)")
                    return
                }
                
                self.image = UIImage(data: dataImage)
            }
        }
    }
}
