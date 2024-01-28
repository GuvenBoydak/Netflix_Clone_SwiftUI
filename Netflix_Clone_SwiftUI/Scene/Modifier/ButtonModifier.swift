//
//  ButtonModifier.swift
//  Netflix_Clone_SwiftUI
//
//  Created by Güven Boydak on 28.01.2024.
//

import Foundation
import SwiftUI

struct ButtonModifier: ViewModifier {
    func body(content:Content) -> some View {
        content
        .frame(width: 130,height: 35)
        .foregroundStyle(Color(ColorKey.tabItemTint.rawValue))
        .overlay(
            RoundedRectangle(cornerRadius: 2)
                .stroke(lineWidth: 1)
                .fill(Color(ColorKey.tabItemTint.rawValue))
        )
        .background(Color(ColorKey.blackWhite.rawValue))
    }
}
