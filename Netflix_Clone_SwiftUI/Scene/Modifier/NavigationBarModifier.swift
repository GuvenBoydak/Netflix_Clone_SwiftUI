//
//  NavigationBarModifier.swift
//  Netflix_Clone_SwiftUI
//
//  Created by Güven Boydak on 29.01.2024.
//

import Foundation
import SwiftUI


struct NavigationBarModifier: ViewModifier {
    var title: String
    func body(content:Content) -> some View {
        content
            .navigationBarItems(leading:
                                    Text(title.locale())
                .font(.title3)
                .bold()
                .foregroundStyle(Color(ColorKey.blackWhite.rawValue)),
                                trailing: HStack {
                Image(systemName: ImageKey.HomeImage.wifi.rawValue)
                Image(systemName: ImageKey.HomeImage.magnify.rawValue)
            })
    }
}



