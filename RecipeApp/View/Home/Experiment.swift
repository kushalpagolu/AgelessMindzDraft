//
//  Experiment.swift
//  AgelessMindz
//
//  Created by Kushal P on 2/15/21.
//  Copyright © 2021 S3soft. All rights reserved.
//

import SwiftUI

struct Experiment: View {
    var woodWorks: WoodWorks
    @State private var showAlertAddFavorite: Bool = false
    @EnvironmentObject var favoriteViewModel: FavoriteViewModel
    @EnvironmentObject var furnitureViewModel: FurnitureViewModel
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack (alignment: .center, spacing: 0) {
                // IMAGE
                ZStack(alignment: .bottom) {
                    ImageLoaderView(imageUrl: woodWorks.image)
                        .scaledToFit()
                    HStack {
                        Spacer()
                        Button(action: {
                            if self.furnitureViewModel.favorite {
                                self.favoriteViewModel.removeProductFromFavorites(woodWorks: self.woodWorks)
                                self.furnitureViewModel.setFavorite(flag: false)
                            } else {
                                self.favoriteViewModel.addProductToFavorites(woodWorks: self.woodWorks)
                                self.furnitureViewModel.setFavorite(flag: true)
                                self.showAlertAddFavorite.toggle()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    self.showAlertAddFavorite.toggle()
                                }
                            }
                        }) {
                            Image(systemName: furnitureViewModel.favorite ? "bookmark.fill" : "bookmark")
                                .font(.system(size:30, weight: .light))
                                .foregroundColor(Color.white)
                                .shadow(color: Color.gray, radius: 2, x: 0, y: 0)
                                .padding(20)
                        }
                    }
                    }
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}


struct Experiment_Previews: PreviewProvider {
    static var previews: some View {
        Experiment(woodWorks: sampleWorks[0])
            .environmentObject(FavoriteViewModel())
            .environmentObject(ShoppingListViewModel())
            .environmentObject(FurnitureViewModel(woodWorks: sampleWorks[0]))
    }
}
