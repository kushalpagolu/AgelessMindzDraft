//
//  AppView.swift
//
//  Created by mt on 11.05.2020.
//  Copyright © 2020 S3soft. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
struct AppView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
            }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
            }
            FavoritesView()
                .tabItem {
                    Image(systemName: "bookmark")
                    Text("Favorites")
            }

                ShoppingListView()
                    .tabItem {
                        Image(systemName: "cart.badge.plus")
                        Text("Shopping List")
                    }
    /*
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
 
            }
*/
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 14.0, *) {
            AppView()
                .environmentObject(FurnitureListViewModel())
                .environmentObject(FavoriteViewModel())
                .environmentObject(ShoppingListViewModel())
        } else {
            // Fallback on earlier versions
        }
    }
}
