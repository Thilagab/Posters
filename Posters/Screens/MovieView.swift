//
//  MovieView.swift
//  Posters
//
//  Created by Thilagawathy Duraisamy on 6/4/2024.
//

import SwiftUI

struct MovieView: View {
   var movies: [MovieViewModel]
    
   
    var body: some View {
        List{
            ForEach(movies, id:\.movieID) { movie in
                   NavigationLink {
                       MovieDetailView(movieId: movie.movieID)
                      // MovieDetailView(movieId: movie.movieID)
                   } label: {
                       HStack(alignment: .top){
                           AsyncImage(url: URL(string: movie.posterUrl)){image in
                             //  image.image?.
                               image.image?.resizable()
                           }.frame(width: 100, height: 120)
                               .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
                            
                           
                           VStack(alignment: .leading){
                               Text(movie.title).font(.headline)
                               Text(movie.year).font(.caption).padding(.top)
                               Text(movie.genre).font(.caption)
                           }.padding(3)
                           Spacer()
                       }.foregroundStyle(.black)//, in: RectangleCornerRadii)
                   }
                }
        }
    }
}

#Preview {
    MovieView(movies: [.init(movie: Movie(title: "hello", year: "1988", movieID: "12AWVV", genre: "Movie", posterUrl: ""))])
}
