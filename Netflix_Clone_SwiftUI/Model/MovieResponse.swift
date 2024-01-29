//
//  MovieResponse.swift
//  Netflix_Clone_SwiftUI
//
//  Created by Güven Boydak on 28.01.2024.
//

import Foundation

struct MovieResponse: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int?
    let release_date: String?
    let vote_average: Double
    

}
struct DayAndMountFormat {
    let mount: String
    let day: String
}
