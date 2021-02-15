
//  Created by mt on 11.05.2020.
//  Copyright © 2020 S3soft. All rights reserved.
//

import SwiftUI

struct FurnitureCardView: View {
    
    // MAKR: PROPERTIES
    var woodWorks: WoodWorks
    @State private var showModal: Bool = false
    @EnvironmentObject var favoriteViewModel: FavoriteViewModel
    @EnvironmentObject var shoppingListViewModel: ShoppingListViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            ImageLoaderView(imageUrl: woodWorks.image)
            
            VStack(alignment: .leading, spacing: 12) {
                // TITLE
                Text(woodWorks.title)
                    .font(.system(.headline, design: .default))
                
                // RATES
                FurnitureRatingView(woodWorks: woodWorks)
                
                // COOKING
                ProductAnalyticsView(woodWorks: woodWorks)
                
            }
            .padding()
            .padding(.bottom, 12)
                
        }
        .background(Color("ColorBackgroundAdaptive"))
        .cornerRadius(12)
        .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 0)
        .onTapGesture {
            self.showModal = true
        }
        .sheet(isPresented: self.$showModal) {
            FurnitureDetailView(woodWorks: self.woodWorks)
                .environmentObject(self.favoriteViewModel)
                .environmentObject(FurnitureViewModel(woodWorks: self.woodWorks))
                .environmentObject(self.shoppingListViewModel)
        }   
    }
}

struct FurnitureCardView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            FurnitureCardView(woodWorks: sampleWorks[5])
                    .previewLayout(.sizeThatFits)
                    .colorScheme(.light)
                
                FurnitureCardView(woodWorks: sampleWorks[7])
                    .previewLayout(.sizeThatFits)
                    .colorScheme(.dark)
        }
    }
}
