//
//  MovieDetailViewModel.swift
//  Posters
//
//  Created by Thilagawathy Duraisamy on 10/4/2024.
//

import Foundation

class MovieDetailViewModel: ObservableObject {
    
    var movieDetail: MovieDetail?
    
    private var httpClient = HTTPClient()
    
    init(movieDetail: MovieDetail? = nil) {
        self.movieDetail = movieDetail
       
    }
    
    func getDetailByMovie(movieID: String)  {
        Task {
            do {
                let details = try await httpClient.getMovieDetailsBy(movieID: movieID)
                movieDetail = details
            } catch {
                fatalError(" Movie details are not available")
            }
        }
        
    }
    
    var title: String {
        self.movieDetail?.title ?? ""
    }
    
    var poster: String {
        self.movieDetail?.poster ?? ""
    }
    
    var plot: String {
        self.movieDetail?.plot ?? ""
    }
    
    var rating: Int {
        get {
            let ratingAsDouble = Double(self.movieDetail?.imdbRating ?? "0.0")
            return Int(ceil(ratingAsDouble ?? 0.0))
        }
         
    }
    
    var director: String {
        self.movieDetail?.director ?? ""
    }
    
  
}
