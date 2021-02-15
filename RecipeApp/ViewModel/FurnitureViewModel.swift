//

import SwiftUI

// MARK: - WoodWorks DATA

final class FurnitureViewModel: ObservableObject {

    @Published var favorite: Bool = false
    var woodWorks: WoodWorks
    init(woodWorks: WoodWorks) {
        self.woodWorks = woodWorks
        let data = UserDefaults.standard.data(forKey: keyFavorites)
        if (data != nil) {
            let favoriteWoodWorks = try! JSONDecoder().decode([WoodWorks].self, from: data!)
            if favoriteWoodWorks.firstIndex(of: woodWorks) != nil {
                self.favorite = true
            }
        }
    }
}

extension FurnitureViewModel {
    func setFavorite(flag: Bool) {
        self.favorite = flag
    }
}
