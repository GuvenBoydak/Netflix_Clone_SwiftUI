//
//  SearchViewModel.swift
//  Netflix_Clone_SwiftUI
//
//  Created by Güven Boydak on 31.01.2024.
//

import Foundation

@MainActor
final class SearchViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var recommended: [Movie] = []
    @Published var searchText = ""
    
    let networkManager: NetworkProtocol
    
    init(networkManager: NetworkProtocol) {
        self.networkManager = networkManager
    }
    
    func searchRequest() async {
        let url = "\(EndPoint.Base_url.rawValue)\(EndPoint.search.rawValue)\(EndPoint.API_KEY.rawValue)\(EndPoint.searchQuery.rawValue)\(searchText)"
        
        do {
            let result: MovieResponse = try await networkManager.getRequest(path: url, method: .get)
            movies = result.results
        } catch {
            print(error)
        }
    }
    
    func recommendedTVSeriesAndMovies() async {
        let url = "\(EndPoint.Base_url.rawValue)\(EndPoint.Popular.rawValue)\(EndPoint.API_KEY.rawValue)\(EndPoint.searchQuery.rawValue)"
        
        do {
            let result: MovieResponse = try await networkManager.getRequest(path: url, method: .get)
            recommended = result.results.shuffled()
        } catch {
            print(error)
        }
    }
}
