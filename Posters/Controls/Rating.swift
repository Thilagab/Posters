//
//  Rating.swift
//  Posters
//
//  Created by Thilagawathy Duraisamy on 4/4/2024.
//

import SwiftUI

struct Rating: View {
    
    @Binding var rating: Int?
    
    
    func starType(index: Int) -> String {
        
        if let rating = self.rating {
            return index <= rating ? "star.fill" : "star"
        } else {
            return "star"
        }
    }
    
    var body: some View {
        HStack {
            ForEach(1...5, id: \.self) { index in
                Image(systemName: starType(index: index))
                    .foregroundStyle(.yellow)
                    
            }
        }
    }
    
}

#Preview {
    Rating(rating: .constant(2))
}
