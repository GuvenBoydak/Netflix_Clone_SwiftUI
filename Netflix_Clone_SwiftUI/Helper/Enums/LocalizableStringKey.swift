//
//  LocalizableStringKey.swift
//  Netflix_Clone_SwiftUI
//
//  Created by Güven Boydak on 28.01.2024.
//

import Foundation

struct LocalizableStringKey {
    enum Tabbar: String {
        case house = "Home Page"
        case newPopular = "New and Popular"
        case myNetflix = "My Netflix"
    }
    enum HomeView: String {
        case play = "Play"
        case plus = "My List"
        case trendingTV = "Trending Tv's"
        case trendingMovie = "Trending Movie's"
        case popular = "Populars"
        case topRating = "Top Raited"
        case forGuven = "For Guven"
    }
    
    enum NewAndPopular: String {
        case remindMe = "Remind Me"
        case notify = "Notify"
        case upComming = "Up Coming"
        case releaseDate = "Release Date"
    }
}
