//
//  NewAndPopularViewModel.swift
//  Netflix_Clone_SwiftUI
//
//  Created by Güven Boydak on 29.01.2024.
//

import Foundation

@MainActor
final class NewAndPopularViewModel: ObservableObject {
    @Published var newPupulars: [Movie] = []
    
    let networkManager: NetworkProtocol
    
    init(networkManager: NetworkProtocol) {
        self.networkManager = networkManager
    }
    
    func getNewAndPupular() async {
        let url = "\(EndPoint.Base_url.rawValue)\(EndPoint.upcoming.rawValue)\(EndPoint.API_KEY.rawValue)\(EndPoint.language.rawValue)"
        
        do {
            let result: MovieResponse = try await networkManager.getRequest(path: url, method: .get)
            newPupulars = result.results
        } catch {
            print(error)
        }
    }
    
    
    func getMonthAndDay(date: String) -> DayAndMountFormat {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let date = dateFormatter.date(from: date) else { return DayAndMountFormat(mount: "", day: "") }
            let englishMonthFormatter = DateFormatter()
            englishMonthFormatter.dateFormat = "MMMM"
            englishMonthFormatter.locale = Locale(identifier: "en_US")
            
            let turkishMonthFormatter = DateFormatter()
            turkishMonthFormatter.dateFormat = "MMMM"
            turkishMonthFormatter.locale = Locale(identifier: "tr_TR")
            
            let dayFormatter = DateFormatter()
            dayFormatter.dateFormat = "dd"
            
            let day = dayFormatter.string(from: date)
            if Locale.current.language.languageCode?.debugDescription == "tr"
            {
                let trMonth = turkishMonthFormatter.string(from: date)
                return DayAndMountFormat(mount: trMonth, day: day)
            } else {
                let enMonth = englishMonthFormatter.string(from: date)
                return DayAndMountFormat(mount: enMonth, day: day)
            }
        }
    }


