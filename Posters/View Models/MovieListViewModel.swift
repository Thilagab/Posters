//
//  MovieListViewModel.swift
//  Posters
//
//  Created by Thilagawathy Duraisamy on 5/4/2024.
//

import Foundation
import UIKit
import SwiftUI

 @MainActor class MovieListViewModel: ObservableObject {
     
    @Published var movieViewModel: [MovieViewModel]
    @Published var posterImage: UIImage?
    private let httpClient: HTTPClient
    
    init() {
        self.movieViewModel = [MovieViewModel]()
        self.posterImage = UIImage()
        self.httpClient = HTTPClient()
    }
    
 
    
    func searchByMovie(title: String) {
        
        Task {
            do {
                let movie = try await httpClient.getMovieBy(search: title)
                self.movieViewModel = movie.map(MovieViewModel.init)
                          
            } catch {
                print(#function,"Movies are not available in ")
            }
        }
    }
    
    func getMoviePosterImage(url: String) {
       
        Task {
            do {
                posterImage = try await httpClient.getPosterImageBy(url: url)
            } catch {
                fatalError("Movie poster is not available")
            }
        }
             
    }
}

struct MovieViewModel {
    
    let movie: Movie
    
    var title: String {
        movie.title
    }
    
    var year: String {
        movie.year
    }
    
    var movieID: String {
        movie.movieID
    }
    
    var genre: String {
        movie.genre
    }
    
    var posterUrl: String {
        movie.posterUrl
    }
}
