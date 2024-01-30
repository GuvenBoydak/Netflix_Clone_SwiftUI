//
//  HomeView.swift
//  Netflix_Clone_SwiftUI
//
//  Created by Güven Boydak on 28.01.2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeVM = HomeViewModel(networkManager: NetworkManager())
    
    init() {

    }
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    HeaderImageView()
                        .padding(.horizontal)
                    TitleTextView(title: LocalizableStringKey.HomeView.trendingMovie.rawValue.locale())
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(homeVM.movies,id: \.id){ data in
                                FilmCellView(url: data.poster_path ?? "")
                            }
                        }
                        .onAppear {
                            Task {
                                await homeVM.getTrendingMovies()
                            }
                        }
                    }
                    TitleTextView(title: LocalizableStringKey.HomeView.trendingTV.rawValue.locale())
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(homeVM.tvs,id: \.id){ data in
                                FilmCellView(url: data.poster_path ?? "")
                            }
                        }
                        .onAppear {
                            Task {
                                await homeVM.getTrendingTv()
                            }
                        }
                    }
                    TitleTextView(title: LocalizableStringKey.HomeView.popular.rawValue.locale())
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(homeVM.populars,id: \.id){ data in
                                FilmCellView(url: data.poster_path ?? "")
                            }
                        }
                        .onAppear {
                            Task {
                                await homeVM.getPopular()
                            }
                        }
                    }
                    TitleTextView(title: LocalizableStringKey.HomeView.topRating.rawValue.locale())
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(homeVM.topRatings,id: \.id){ data in
                                FilmCellView(url: data.poster_path ?? "")
                            }
                        }
                        .onAppear {
                            Task {
                                await homeVM.getTopRaited()
                            }
                        }
                    }
                }.padding(.horizontal)
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.secondary, .primary]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all))
            .modifier(NavigationBarModifier(title: LocalizableStringKey.HomeView.forGuven.rawValue))
            
        }
    }
}

#Preview {
    HomeView()
}

private struct HeaderImageView: View {
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: "https://m.media-amazon.com/images/M/MV5BMDQ0NjgyN2YtNWViNS00YjA3LTkxNDktYzFkZTExZGMxZDkxXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_FMjpg_UX1000_.jpg")) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350)
                    .overlay(
                        ZStack {
                            LinearGradient(gradient: Gradient(colors: [.clear, .primary]), startPoint: .center, endPoint: .bottom)
                                .overlay{
                                    VStack {
                                        Spacer()
                                        HStack {
                                            Button(action: {}, label: {
                                                HStack{
                                                    Image(systemName: ImageKey.HomeImage.play.rawValue)
                                                    TitleTextView(title: LocalizableStringKey.HomeView.play.rawValue.locale())
                                                }
                                            })
                                            .modifier(ButtonModifier())
                                            Button(action: {}, label: {
                                                HStack{
                                                    Image(systemName: ImageKey.HomeImage.plus.rawValue)
                                                    TitleTextView(title: LocalizableStringKey.HomeView.plus.rawValue.locale())
                                                }
                                            })
                                            .modifier(ButtonModifier())
                                        }
                                        .padding()
                                    }
                                }
                        }
                    )
                    .cornerRadius(15)
            } placeholder: {
                ProgressView()
            }
        }
    }
}

private struct TitleTextView: View {
    var title: LocalizedStringKey
    var body: some View {
        Text(title)
            .font(.title3)
            .bold()
            .foregroundStyle(Color(ColorKey.tabItemTint.rawValue))
    }
}
