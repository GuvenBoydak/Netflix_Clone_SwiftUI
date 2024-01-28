//
//  TabbarView.swift
//  Netflix_Clone_SwiftUI
//
//  Created by Güven Boydak on 28.01.2024.
//

import SwiftUI

struct TabbarView: View {
    init() {
        UITabBar.appearance().barTintColor = UIColor(named: ColorKey.blackWhite.rawValue)
        }
    
    var body: some View {
            TabView {
                HomeView().tabItem {
                    Image(systemName: ImageKey.Tabbar.house.rawValue)
                    Text("Anasayfa")
                }
                Text("B")
                    .tabItem {
                        Image(systemName: ImageKey.Tabbar.newPopular.rawValue)
                        Text("Yeni ve Populer")
                    }
                Text("C").tabItem {
                    Image(systemName: ImageKey.Tabbar.myNetflix.rawValue)
                    Text("Benim Netflix'im")
                }
            }
            .tint(Color(ColorKey.tabItemTint.rawValue))
            .background(Color.black)
    }
}

#Preview {
    TabbarView()
}
