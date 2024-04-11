//
//  HTTPClient.swift
//  Posters
//
//  Created by Thilagawathy Duraisamy on 4/4/2024.
//

import Foundation
import UIKit
import SwiftUI

enum NetworkError: Error {
    case noData
    case badURL
    case decodingError
    case serverError
}

enum ResponseError: Error {
    case noImageAvailable
}

class HTTPClient {
    
    func getMovieBy(search: String)  async throws -> [Movie] {
        
        var urlComponnets = URLComponents(string: Constants.URL_OMDB)
        urlComponnets?.queryItems = [ "s": search,
                                      "apikey": Constants.API_KEY_OMDB
                                      
        ].map{ URLQueryItem(name: $0,value: $1)  }
        
        guard let urlRequest = urlComponnets?.url else {
            throw NetworkError.badURL
                
        }
        
           
            let (data, response) = try await URLSession.shared.data(from: urlRequest)
                
            if let httpResponse = response as? HTTPURLResponse,
               httpResponse.statusCode != 200  {
                print(httpResponse)
                throw NetworkError.serverError
            }
        
            //print(String(data: data, encoding: .utf8))
                
            let jsonDecoder = JSONDecoder()
            let movieResonse = try jsonDecoder.decode(MovieResponse.self, from: data)
            return movieResonse.movie
    }
    // Oneway of doing asychronous task with use of completion handler and resume()
//    func getMovieBy(search: String, completion: @escaping (Result<[Movie]?,NetworkError>) -> Void) {
//        
//        var urlComponnets = URLComponents(string: Constants.URL_OMDB)
//        urlComponnets?.queryItems = [ "s": search,
//                                      "apikey": Constants.API_KEY_OMDB
//                                     
//                                     ].map{ URLQueryItem(name: $0,value: $1)  }
//        
//        guard let urlRequest = urlComponnets?.url else {
//            return completion(.failure(.badURL))
//        }
//        
//        
//            URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, response, error in
//                
//                guard let movieData = data else {
//                    return completion(.failure(.noData))
//                }
//                
//                if let httpResponse = response as? HTTPURLResponse,
//                   httpResponse.statusCode == 200  {
//                    return completion(.failure(.serverError))
//                }
//                
//                let jsonDecoder = JSONDecoder()
//                guard let movieResonse = try? jsonDecoder.decode(MovieResponse.self, from: movieData) else {
//                    return completion(.failure(.decodingError))
//                }
//                
//                completion(.success(movieResonse.movie))
//            }).resume()
//        
//    }
    
    func getPosterImageBy(url: String) async throws -> UIImage? {
        
        guard let url =  URL(string: url) else {
            fatalError(" Image not available ")
            
        }
       
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse ,
              httpResponse.statusCode == 200 else {
            fatalError(response.debugDescription)
               
        }
        
        let imageData = UIImage(data: data)
        
        return imageData
        
    }
    
    func getMovieDetailsBy(movieID: String) async throws -> MovieDetail {
       
        var urlComponnets = URLComponents(string: Constants.URL_OMDB)
        urlComponnets?.queryItems = [ "i": movieID,
                                      "apikey": Constants.API_KEY_OMDB
        ].map{ URLQueryItem(name: $0,value: $1)  }
        
        guard let urlRequest = urlComponnets?.url else {
            throw NetworkError.badURL
                
        }
        let (data, response) = try await URLSession.shared.data(from: urlRequest)
            
        if let httpResponse = response as? HTTPURLResponse,
           httpResponse.statusCode != 200  {
            print(httpResponse)
            throw NetworkError.serverError
        }
    
        //print(String(data: data, encoding: .utf8))
            
        let jsonDecoder = JSONDecoder()
        let movieDetails = try jsonDecoder.decode(MovieDetail.self, from: data)
        return movieDetails
    }
}
