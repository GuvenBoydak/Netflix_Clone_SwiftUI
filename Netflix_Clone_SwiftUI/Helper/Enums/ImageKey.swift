//
//  ImageKey.swift
//  Netflix_Clone_SwiftUI
//
//  Created by Güven Boydak on 28.01.2024.
//

import Foundation


struct ImageKey {
    enum Tabbar: String {
        case house = "house"
        case newPopular = "play.rectangle.on.rectangle"
        case myNetflix = "person.crop.rectangle.stack"
    }
    enum HomeImage: String {
        case netflix = "netflix"
        case plus = "plus"
        case play = "play.fill"
        case magnify = "magnifyingglass"
        case wifi = "tv.badge.wifi"
    }
}
