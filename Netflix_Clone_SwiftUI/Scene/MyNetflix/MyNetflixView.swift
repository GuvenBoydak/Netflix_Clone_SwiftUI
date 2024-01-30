//
//  MyNetflixView.swift
//  Netflix_Clone_SwiftUI
//
//  Created by Güven Boydak on 29.01.2024.
//

import SwiftUI

struct MyNetflixView: View {
    @StateObject var myNetflixVM = MyNetflixViewModel(networkManager: NetworkManager())
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack {
                    HeaderView()
                    NotifyView()
                    DownlandsView()
                    HStack {
                        Text(LocalizableStringKey.MyNetflix.favorite.rawValue.locale())
                            .font(.title3)
                            .bold()
                            .foregroundStyle(Color.tabItemTint)
                        Spacer()
                    }
                    ScrollView(.horizontal,showsIndicators: false) {
                        HStack {
                            ForEach(myNetflixVM.popular,id: \.id) { data in
                                PopularTVMoviesView(url: data.poster_path ?? "")
                            }
                        }
                        .task {
                            await myNetflixVM.getPopular()
                        }
                    }
                    HStack {
                        Text(LocalizableStringKey.MyNetflix.mylist.rawValue.locale())
                            .font(.title3)
                            .bold()
                            .foregroundStyle(Color.tabItemTint)
                        Spacer()
                        Text(LocalizableStringKey.MyNetflix.seeAll.rawValue.locale())
                            .font(.subheadline)
                            .foregroundStyle(Color.tabItemTint)
                        Image(systemName: ImageKey.MYNetflix.seeAll.rawValue)
                            .foregroundStyle(Color.tabItemTint)
                    }
                    ScrollView(.horizontal,showsIndicators: false) {
                        HStack {
                            ForEach(myNetflixVM.myList,id:\.id) { data in
                                FilmCellView(url: data.poster_path ?? "")
                            }
                        }
                        .task {
                            await myNetflixVM.getMyList()
                        }
                    }
                    HStack {
                        Text(LocalizableStringKey.MyNetflix.keepWatching.rawValue.locale())
                            .font(.title3)
                            .bold()
                            .foregroundStyle(Color.tabItemTint)
                        Spacer()
                    }
                    ScrollView(.horizontal,showsIndicators: false) {
                        HStack {
                            ForEach(myNetflixVM.keepWathings,id:\.id) { data in
                                KeepWatchingView(url: data.poster_path ?? "")
                            }
                        }
                        .task {
                            await myNetflixVM.getkeepWatching()
                        }
                    }
                }.padding(.horizontal)
            }
            .background(Color.blackWhite)
            .modifier(NavigationBarModifier(title: LocalizableStringKey.Tabbar.myNetflix.rawValue,isMyNetflix: true))
        }
    }
}

#Preview {
    MyNetflixView()
}

private struct DownlandsView: View {
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 45, height: 45)
                Image(systemName: ImageKey.MYNetflix.downland.rawValue)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(Color.tabItemTint)
            }
            Text(LocalizableStringKey.MyNetflix.downland.rawValue.locale())
                .foregroundStyle(Color.tabItemTint)
            Spacer()
            Image(systemName: ImageKey.MYNetflix.seeAll.rawValue)
                .foregroundStyle(Color.tabItemTint)
        }
    }
}
private struct NotifyView: View {
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .fill(Color.red)
                    .frame(width: 45, height: 45)
                Image(systemName: ImageKey.MYNetflix.bell.rawValue)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(Color.tabItemTint)
            }
            Text(LocalizableStringKey.MyNetflix.notify.rawValue.locale())
                .foregroundStyle(Color.tabItemTint)
            Spacer()
            Image(systemName: ImageKey.MYNetflix.seeAll.rawValue)
                .foregroundStyle(Color.tabItemTint)
        }
    }
}

private struct PopularTVMoviesView: View {
    var url: String
    var body: some View {
        VStack {
            FilmCellView(url: url)
                .padding(.bottom,-12)
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .fill(.gray)
                    .frame(height:40)
                    .opacity(0.1)
                    .overlay(
                        HStack {
                            Image(systemName: ImageKey.MYNetflix.suggest.rawValue)
                                .resizable()
                                .frame(width: 20,height: 20)
                                .foregroundStyle(Color.tabItemTint)
                            Text(LocalizableStringKey.MyNetflix.suggest.rawValue.locale())
                                .font(.subheadline)
                                .foregroundStyle(Color.tabItemTint)
                        }
                    )
            }
        }
    }
}

private struct KeepWatchingView: View {
    var url: String
    var body: some View {
        VStack {
            FilmCellView(url: url)
                .padding(.bottom,-12)
                .overlay(
                    ZStack {
                        Circle()
                            .fill(Color.black)
                            .opacity(0.4)
                            .frame(width: 55)
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 1)
                            )
                        Image(systemName: ImageKey.MYNetflix.play.rawValue)
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                            .foregroundStyle(Color.tabItemTint)
                    }
                )
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .fill(.gray)
                    .frame(height:40)
                    .opacity(0.1)
                    .overlay(
                        HStack {
                            Image(systemName: ImageKey.MYNetflix.attention.rawValue)
                                .resizable()
                                .frame(width: 25,height: 25)
                                .padding(.trailing,30)
                                .foregroundStyle(Color.tabItemTint)
                            Image(systemName: ImageKey.MYNetflix.setting.rawValue)
                                .resizable()
                                .frame(width: 3,height: 20)
                                .foregroundStyle(Color.tabItemTint)
                        }
                    )
            }
        }
    }
}

private struct HeaderView: View {
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://occ-0-3175-3467.1.nflxso.net/dnm/api/v6/vN7bi_My87NPKvsBoib006Llxzg/AAAABfjwXqIYd3kCEU6KWsiHSHvkft8VhZg0yyD50a_pHXku4dz9VgxWwfA2ontwogStpj1NE9NJMt7sCpSKFEY2zmgqqQfcw1FMWwB9.png?r=229")) { image in
                image
                    .resizable()
                    .frame(width:70,height: 70)
                    .cornerRadius(10)
            } placeholder: {
                ProgressView()
            }
            HStack {
                Text(LocalizableStringKey.MyNetflix.account.rawValue.locale())
                    .font(.title2)
                    .bold()
                    .foregroundStyle(Color.tabItemTint)
                Image(systemName: ImageKey.MYNetflix.accountDown.rawValue)
                    .resizable()
                    .frame(width: 15,height: 10)
                    .foregroundStyle(Color.tabItemTint)
            }
        }
    }
}
