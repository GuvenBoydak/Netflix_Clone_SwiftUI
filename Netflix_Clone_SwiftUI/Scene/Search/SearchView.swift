//
//  SearchView.swift
//  Netflix_Clone_SwiftUI
//
//  Created by Güven Boydak on 30.01.2024.
//

import SwiftUI

struct SearchView: View {
    @StateObject var searchVM = SearchViewModel(networkManager: NetworkManager())
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                SearchBarView()
                    .environmentObject(searchVM)
                HStack {
                    Text(LocalizableStringKey.Search.recommended.rawValue.locale())
                        .padding(.leading)
                        .font(.title3)
                    Spacer()
                }
                .foregroundStyle(.tabItemTint)
                .frame(maxWidth: .infinity)
                if !searchVM.searchText.isEmpty {
                    ForEach(searchVM.movies, id: \.id) { movie in
                        SearchCellView(movie: movie)
                    }
                } else {
                    ForEach(searchVM.recommended,id:\.id) { recommended in
                        SearchCellView(movie: recommended)
                    }
                }
            }
            .task {
                await searchVM.recommendedTVSeriesAndMovies()
            }
        }
        .background(Color.blackWhite)
    }
}


#Preview {
    SearchView()
}

private struct SearchCellView: View {
    var movie: Movie
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: "\(EndPoint.image_url.rawValue)\(movie.poster_path ?? "")")) { image in
                image
                    .resizable()
                    .frame(width: 80,height: 80)
            } placeholder: {
                ProgressView()
            }
            Text(movie.original_title ?? "")
                .font(.headline)
                .foregroundStyle(.white)
            Spacer()
            ZStack {
                Circle()
                    .fill(Color.black)
                    .opacity(0.6)
                    .frame(width: 40)
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 2)
                    )
                Image(systemName: ImageKey.MYNetflix.play.rawValue)
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 15, height: 15)
                    .foregroundStyle(Color.tabItemTint)
            }
        }
        .padding(.horizontal)
    }
}

private struct SearchBarView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var searchVM : SearchViewModel
    @State private var isEditing: Bool = false
    var body: some View {
        HStack {
            Image(systemName: ImageKey.Search.back.rawValue)
                .resizable()
                .frame(width: 15,height: 25)
                .foregroundStyle(.white)
                .padding(.trailing)
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
            ZStack {
                Color(uiColor: UIColor.gray)
                    .opacity(0.4)
                    .cornerRadius(10)
                HStack {
                    Image(systemName: ImageKey.HomeImage.magnify.rawValue)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                    
                    TextField(LocalizableStringKey.Search.searchText.rawValue.locale(), text: $searchVM.searchText)
                        .onChange(of: searchVM.searchText, perform: { newValue in
                            Task {
                                await searchVM.searchRequest()
                            }
                                    })
                        .foregroundStyle(.white)
                        .padding(7)
                }
                .task {
                    if isEditing {
                        await searchVM.searchRequest()
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}
