//
//  Movie.swift
//  Posters
//
//  Created by Thilagawathy Duraisamy on 4/4/2024.
//

import Foundation
import UIKit

// Model for the movie search response from the OMDB API
// This model is used to decode the JSON response from the API
// It contains an array of Movie objects
// and the CodingKeys enum is used to map the JSON keys to the Swift properties
// The movieID is used to uniquely identify each movie
// The posterUrl is used to display the movie poster image

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

