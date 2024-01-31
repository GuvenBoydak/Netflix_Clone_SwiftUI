//
//  NetworkHelper.swift
//  Netflix_Clone_SwiftUI
//
//  Created by Güven Boydak on 28.01.2024.
//

import Foundation

enum ErrorMessage: Error {
    case InvalidURLError
    case DataParseErrror
}

enum HTTPMethod: String {
    case get = "GET"
}

enum EndPoint: String {
    case API_KEY = "697d439ac993538da4e3e60b54e762cd"
    case Base_url = "https://api.themoviedb.org"
    case Trending_tv = "/3/trending/tv/day?api_key="
    case Trending_movie = "/3/trending/movie/day?api_key="
    case Popular = "/3/movie/popular?api_key="
    case top_raited = "/3/movie/top_rated?api_key="
    case upcoming = "/3/movie/upcoming?api_key="
    case language = "&language=en-US&page=1"
    case image_url = "https://image.tmdb.org/t/p/w500"
    case search = "/3/search/movie?api_key="
    case searchQuery = "&query="
}

