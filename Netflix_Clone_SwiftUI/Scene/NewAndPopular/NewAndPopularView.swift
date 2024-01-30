//
//  NewAndPopularView.swift
//  Netflix_Clone_SwiftUI
//
//  Created by Güven Boydak on 29.01.2024.
//

import SwiftUI

struct NewAndPopularView: View {
    @StateObject var newAndPopularsVM = NewAndPopularViewModel(networkManager: NetworkManager())
    @State  var keyword: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack {
                    HStack {
                        Text("🍿").padding(.trailing,-9)
                        Text(LocalizableStringKey.NewAndPopular.upComming.rawValue.locale())
                            .font(.title3)
                            .bold()
                            .foregroundStyle(Color.tabItemTint)
                        Spacer()
                    }
                    ForEach(newAndPopularsVM.newPupulars,id:\.id) { data in
                        MovieCellView(movie: data)
                            .environmentObject(newAndPopularsVM)
                    }
                    Spacer()
                }
                .task {
                    await newAndPopularsVM.getNewAndPupular()
                }
            }
            .background(Color.blackWhite)
            .modifier(NavigationBarModifier(title: LocalizableStringKey.HomeView.forGuven.rawValue))
        }
    }
}

#Preview {
    NewAndPopularView()
}

private struct MovieCellView: View {
  @EnvironmentObject var newAndPopularVM: NewAndPopularViewModel
    var movie: Movie

    var body: some View {
        HStack {
            VStack {
                Text(newAndPopularVM.getMonthAndDay(date: movie.release_date ?? "").mount.prefix(3))
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                Text(newAndPopularVM.getMonthAndDay(date: movie.release_date ?? "").day)
                    .font(.title)
                    .bold()
                    .foregroundStyle(Color.tabItemTint)
                Spacer()
            }
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: "\(EndPoint.image_url.rawValue)\(movie.poster_path ?? "")")) { image in
                    image
                        .resizable()
                        .frame(height:200)
                        .cornerRadius(10)
                } placeholder: {
                    ProgressView()
                }
                HStack {
                    Text(movie.original_title ?? "")
                        .font(.title2)
                        .lineLimit(2)
                        .bold()
                        .foregroundStyle(Color.tabItemTint)
                    Spacer()
                    VStack(spacing: 7) {
                        Image(systemName: ImageKey.NewAndPopular.bell.rawValue)
                            .resizable()
                            .frame(width: 25,height: 25)
                            .foregroundStyle(Color.tabItemTint)
                        Text(LocalizableStringKey.NewAndPopular.remindMe.rawValue.locale())
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    .padding(.horizontal)
                    VStack(spacing: 7) {
                        Image(systemName: ImageKey.NewAndPopular.notify.rawValue)
                            .resizable()
                            .frame(width: 20,height: 20)
                            .foregroundStyle(Color.tabItemTint)
                        Text(LocalizableStringKey.NewAndPopular.notify.rawValue.locale())
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    .padding(.horizontal)
                }
                HStack {
                    Text(LocalizableStringKey.NewAndPopular.releaseDate.rawValue.locale())
                        .font(.subheadline)
                        .foregroundStyle(Color.tabItemTint)
                        .padding(.trailing,-5)
                    Text(": \(newAndPopularVM.getMonthAndDay(date: movie.release_date ?? "").day) \(newAndPopularVM.getMonthAndDay(date: movie.release_date ?? "").mount)")
                        .font(.subheadline)
                        .foregroundStyle(Color.tabItemTint)
                }
                Text(movie.original_title ?? "")
                    .font(.headline)
                    .bold()
                    .foregroundStyle(Color.tabItemTint)
                    .padding(.vertical,1)
                Text(movie.overview ?? "")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
        }.padding(.bottom)
    }
}
