
//
//  Created by mt on 11.05.2020.
//  Copyright © 2020 S3soft. All rights reserved.
//

import SwiftUI

struct FurnitureRowView: View {
    
    // MARK: - PROPERTIEIS
    var categoryName: String
    var woodWorks: [WoodWorks]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.woodWorks) { item in
                        FurnitureItem(woodWorks: item)
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct FurnitureItem: View {
    
    // MARK: - PROPERTIEIS
    var woodWorks: WoodWorks
    @State private var showModal: Bool = false
    
    @EnvironmentObject var favoriteViewModel: FavoriteViewModel
    @EnvironmentObject var shoppingListViewModel: ShoppingListViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .bottom) {
                ImageLoaderView(imageUrl: woodWorks.image)
                    .frame(width: 155, height: 155, alignment: .center)
                    
                HStack {
                    Image(systemName: "person.2")
                        .foregroundColor(Color.white)
                        .font(.callout)
                        .padding(.leading, 5)
                    
                    
                    Text("\(woodWorks.noOfPastOrders)")
                        .foregroundColor(Color.white)
                        .font(.callout)
                    
                    Spacer()
                /*
                    Text("\(woodWorks.preparation) min")
                        .foregroundColor(Color.white)
                        .font(.callout)
                        .padding(.trailing, 5)
                    */
                }
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .top, endPoint: .bottom)
                        .padding(.top, -20)
                )
                
            }
            .cornerRadius(5)
            
            Text(woodWorks.title)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
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

struct FurnitureRowView_Previews: PreviewProvider {
    static var previews: some View {
        FurnitureRowView(categoryName:"Trending", woodWorks: sampleWorks)
    }
}
