//
//  MovieDetail.swift
//  Posters
//
//  Created by Thilagawathy Duraisamy on 10/4/2024.
//

import Foundation

struct MovieDetail: Decodable {
    let title: String
    let year: String
    let rated: String
    let plot: String
    let director: String
    let actors: String
    let imdbRating: String
    let poster: String
    let movieId: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case plot = "Plot"
        case director = "Director"
        case actors = "Actors"
        case imdbRating = "imdbRating"
        case poster = "Poster"
        case movieId = "imdbID"
    }
}

