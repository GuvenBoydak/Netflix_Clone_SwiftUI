//
//  FilmCellView.swift
//  Netflix_Clone_SwiftUI
//
//  Created by Güven Boydak on 28.01.2024.
//

import SwiftUI

struct FilmCellView: View {
    var url: String
    var body: some View {
        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(url)")) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(height: 200)
        } placeholder: {
            ProgressView()
        }
    }
}

#Preview {
    FilmCellView(url: "")
}
