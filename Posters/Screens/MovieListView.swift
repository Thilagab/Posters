//
//  MovieListView.swift
//  Posters
//
//  Created by Thilagawathy Duraisamy on 6/4/2024.
//

import SwiftUI
// // MovieListView is a SwiftUI view that displays a list of movies.
//// It uses the MovieListViewModel to fetch and manage the movie data.
///// The view is searchable, allowing users to search for movies by title.
struct MovieListView: View {
    @StateObject var movieList = MovieListViewModel()
   
    @State var searchString = ""
     

    var body: some View {
       NavigationStack{
           MovieView(movies: self.movieList.movieViewModel)
        }
        .searchable(text: $searchString)
            .onSubmit(of:.search) {
                if searchString.isEmpty {
                    print("search empty")
                } else {
                    print("search non empty")
                    movieList.searchByMovie(title: searchString)
                }
            
            }
            
        .onAppear() {
           movieList.searchByMovie(title: "batman")
    }
                
        
// calling old method with completion handler
//                    HTTPClient().getMovieBy(search: "batman") { result in
//                        switch result {
//                        case .success(let movies):
//                            print(movies)
//                        case .failure(let error):
//                            print(error)
//                        }
//                      }
    }
}

#Preview {
    MovieListView()
}
