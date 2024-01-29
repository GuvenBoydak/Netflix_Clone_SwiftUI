//
//  TabbarView.swift
//  Netflix_Clone_SwiftUI
//
//  Created by Güven Boydak on 28.01.2024.
//

import SwiftUI

struct TabbarView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor(named: ColorKey.blackWhite.rawValue)
        UITabBar.appearance().barTintColor = UIColor(named: ColorKey.blackWhite.rawValue)
        }
    
    var body: some View {
            TabView {
                HomeView()
                    .tabItem {
                    Image(systemName: ImageKey.Tabbar.house.rawValue)
                    Text(LocalizableStringKey.Tabbar.house.rawValue.locale())
                }
                NewAndPopularView()
                    .tabItem {
                        Image(systemName: ImageKey.Tabbar.newPopular.rawValue)
                        Text(LocalizableStringKey.Tabbar.newPopular.rawValue.locale())
                    }
                Text("Play").tabItem {
                    Image(systemName: ImageKey.Tabbar.myNetflix.rawValue)
                    Text(LocalizableStringKey.Tabbar.myNetflix.rawValue.locale())
                }
            }
            .tint(Color(ColorKey.tabItemTint.rawValue))
            .background(Color.black)
    }
}

#Preview {
    TabbarView()
}
