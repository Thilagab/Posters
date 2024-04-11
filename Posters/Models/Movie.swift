//
//  Movie.swift
//  Posters
//
//  Created by Thilagawathy Duraisamy on 4/4/2024.
//

import Foundation
import UIKit

struct MovieResponse: Codable {
    let movie: [Movie]

    private enum CodingKeys: String, CodingKey {
        case movie = "Search"
    }
}

struct Movie: Codable {
    
    var title: String
    var year: String
    var movieID: String
    var genre: String
    var posterUrl: String
    
    private enum CodingKeys: String, CodingKey {
       
        case title = "Title"
        case year = "Year"
        case movieID = "imdbID"
        case genre = "Type"
        case posterUrl = "Poster"
        
    }
}

