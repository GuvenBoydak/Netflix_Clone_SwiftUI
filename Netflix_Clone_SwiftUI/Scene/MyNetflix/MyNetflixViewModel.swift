//
//  MyNetflixViewModel.swift
//  Netflix_Clone_SwiftUI
//
//  Created by Güven Boydak on 30.01.2024.
//

import Foundation
@MainActor
final class MyNetflixViewModel: ObservableObject {
    @Published var popular: [Movie] = []
    @Published var myList: [Movie] = []
    @Published var keepWathings: [Movie] = []
    
    let networkManager: NetworkProtocol
    
    init(networkManager: NetworkProtocol) {
        self.networkManager = networkManager
    }
    
    func getPopular() async {
        let url = "\(EndPoint.Base_url.rawValue)\(EndPoint.Popular.rawValue)\(EndPoint.API_KEY.rawValue)\(EndPoint.language.rawValue)"
        do {
            let result: MovieResponse = try await networkManager.getRequest(path: url, method: .get)
            popular = result.results
        } catch {
            print(error)
        }
    }
    
    func getMyList() async {
        let url = "\(EndPoint.Base_url.rawValue)\(EndPoint.top_raited.rawValue)\(EndPoint.API_KEY.rawValue)\(EndPoint.language.rawValue)"
        do {
            let result: MovieResponse = try await networkManager.getRequest(path: url, method: .get)
            myList = result.results.suffix(5)
        } catch {
            print(error)
        }
    }
    
    func getkeepWatching() async {
        let url = "\(EndPoint.Base_url.rawValue)\(EndPoint.top_raited.rawValue)\(EndPoint.API_KEY.rawValue)\(EndPoint.language.rawValue)"
        do {
            let result: MovieResponse = try await networkManager.getRequest(path: url, method: .get)
            keepWathings = result.results.suffix(8)
        } catch {
            print(error)
        }
    }
}
