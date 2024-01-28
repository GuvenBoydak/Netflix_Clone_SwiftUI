//
//  HomeViewModel.swift
//  Netflix_Clone_SwiftUI
//
//  Created by Güven Boydak on 28.01.2024.
//

import Foundation
 @MainActor
final class HomeViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var tvs: [Movie] = []
    @Published var populars: [Movie] = []
    @Published var topRatings: [Movie] = []
    
    let networkManager: NetworkProtocol
    
    init(networkManager: NetworkProtocol) {
        self.networkManager = networkManager
    }
    
    func getTrendingMovies() async {
        let url = "\(EndPoint.Base_url.rawValue)\(EndPoint.Trending_movie.rawValue)\(EndPoint.API_KEY.rawValue)\(EndPoint.language.rawValue)"
        do {
            let result: MovieResponse = try await networkManager.getRequest(path: url, method: .get)
                self.movies = result.results
        } catch {
            print(error)
        }
    }
    
    func getTrendingTv() async {
        let url = "\(EndPoint.Base_url.rawValue)\(EndPoint.Trending_tv.rawValue)\(EndPoint.API_KEY.rawValue)\(EndPoint.language.rawValue)"
        do {
            let result: MovieResponse = try await networkManager.getRequest(path: url, method: .get)
                self.tvs = result.results
        } catch {
            print(error)
        }
    }
    
    func getPopular() async {
        let url = "\(EndPoint.Base_url.rawValue)\(EndPoint.Popular.rawValue)\(EndPoint.API_KEY.rawValue)\(EndPoint.language.rawValue)"
        do {
            let result: MovieResponse = try await networkManager.getRequest(path: url, method: .get)
            self.populars = result.results.shuffled()
        } catch {
            print(error)
        }
    }
    
    func getTopRaited() async {
        let url = "\(EndPoint.Base_url.rawValue)\(EndPoint.top_raited.rawValue)\(EndPoint.API_KEY.rawValue)\(EndPoint.language.rawValue)"
        do {
            let result: MovieResponse = try await networkManager.getRequest(path: url, method: .get)
                self.topRatings = result.results
        } catch {
            print(error)
        }
    }
}
