//
//  Created by mt on 13.05.2020.
//  Copyright © 2020 S3soft. All rights reserved.
//

import SwiftUI

final class FavoriteViewModel: ObservableObject {
    @Published var favoriteWoodWorks: [WoodWorks] = []
    let defaults = UserDefaults.standard
    
    init() {
        let data = defaults.data(forKey: keyFavorites)
        if (data != nil) {
            favoriteWoodWorks = try! JSONDecoder().decode([WoodWorks].self, from: data!)
        }
    }
}

extension FavoriteViewModel {
    func addProductToFavorites(woodWorks: WoodWorks) {
        favoriteWoodWorks.append(woodWorks)
        let data = try! JSONEncoder().encode(favoriteWoodWorks)
        defaults.set(data, forKey: keyFavorites)
    }
    func removeProductFromFavorites(woodWorks: WoodWorks) {
        if let index = favoriteWoodWorks.firstIndex(of: woodWorks) {
            favoriteWoodWorks.remove(at: index)
        }
        let data = try! JSONEncoder().encode(favoriteWoodWorks)
        defaults.set(data, forKey: keyFavorites)
    }
}
