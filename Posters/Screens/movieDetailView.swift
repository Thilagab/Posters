//
//  movieDetailView.swift
//  Posters
//
//  Created by Thilagawathy Duraisamy on 10/4/2024.
//

import SwiftUI

struct movieDetailView: View {
    
    let movieId: String
    @StateObject var movieDetailVM = MovieDetailViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
//                URLImage(url: movieDetailVM.poster).clipShape(RoundedRectangle(cornerSize: /*@START_MENU_TOKEN@*/CGSize(width: 20, height: 10)/*@END_MENU_TOKEN@*/))
//                Text(movieDetailVM.title).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//                Text(movieDetailVM.plot)
//                Text("Director").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                Text(movieDetailVM.director)
//                HStack{
//                    Rating(rating: .constant(movieDetailVM.rating))
//                    Text("\(movieDetailVM.rating)/5")
//                }.padding(.top, 10)
//                Spacer()
            }.padding()
        }.onAppear() {
            movieDetailVM.getDetailByMovie(movieID: movieId)
        }
    }
}

#Preview {
    movieDetailView(movieId: "gg")
}
