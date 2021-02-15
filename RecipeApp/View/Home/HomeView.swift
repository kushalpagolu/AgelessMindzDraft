//
//  HomeView.swift
//
//  Created by mt on 11.05.2020.
//  Copyright © 2020 S3soft. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - PROPERTIES
    
    @EnvironmentObject var productListViewModel: FurnitureListViewModel
    
    var body: some View {
        ZStack (alignment: .bottom) {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 20) {
                    
                    // MARK: - HEADER
                    
                    HeaderView()
                    
                    // MARK: - CATEGORIES
                    
                    if self.productListViewModel.dataEditorChoiceIsLoading {
                        ActivityIndicator()
                            .frame(width:30, height: 30)
                            .foregroundColor(.orange)
                            .opacity(self.productListViewModel.dataEditorChoiceIsLoading ? 1.0 : 0.0)
                    } else {
                         FurnitureRowView(categoryName: "Editor's Choice", woodWorks: productListViewModel.editorWoodWorksData)
                        
                    }
                    
                    if self.productListViewModel.dataTrendingIsLoading {
                        ActivityIndicator()
                           .frame(width:30, height: 30)
                           .foregroundColor(.orange)
                    } else {
                        FurnitureRowView(categoryName: "Trending", woodWorks: productListViewModel.trendingWoodWorksData)
                    }
                    
                    
                    // MARK: - Furniture CARDS
                    
                    Text("All Furniture")
                        .fontWeight(.bold)
                        .modifier(TitleModifier())
                    
                    VStack(alignment: .center, spacing: 20) {
                        
                        if self.productListViewModel.dataIsLoading {
                            ActivityIndicator()
                               .frame(width:30, height: 30)
                               .foregroundColor(.orange)
                        }
                        
                        ForEach(productListViewModel.woodWorksData) { item in
                            FurnitureCardView(woodWorks: item)
                        }
                    }
                    .frame(maxWidth: 640)
                    .padding(.horizontal)
                    .padding(.bottom, 160)
                }
            }
            .edgesIgnoringSafeArea(.all)
            .padding(0)
                
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(FurnitureListViewModel())
    }
}
