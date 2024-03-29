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
    var isMyNetflix: Bool = false
    @State private var isSheetPresented: Bool = false
    func body(content:Content) -> some View {
        content
            .navigationBarItems(leading:
                                    Text(title.locale())
                .font(.title3)
                .bold()
                .foregroundStyle(Color.tabItemTint),
                                trailing: HStack {
                Image(systemName: ImageKey.HomeImage.wifi.rawValue)
                    .foregroundStyle(Color.tabItemTint)
                
                Image(systemName: ImageKey.HomeImage.magnify.rawValue)
                    .foregroundStyle(Color.tabItemTint)
                    .onTapGesture {
                        isSheetPresented.toggle()
                    }
                    .fullScreenCover(isPresented: $isSheetPresented) {
                        SearchView().navigationBarBackButtonHidden()
                    }
                
                if isMyNetflix {
                    Image(systemName: ImageKey.MYNetflix.setting.rawValue)
                        .foregroundStyle(Color.tabItemTint)
                }
            })
    }
}



