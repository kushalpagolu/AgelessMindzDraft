//
//  ShoppingListView.swift

//
//  Created by mt on 13.05.2020.
//  Copyright © 2020 S3soft. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
struct ShoppingListView: View {
    // MARK: - PROPERTIES
    @State private var isPresented = false
    @EnvironmentObject var shoppingListViewModel: ShoppingListViewModel
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 20) {
                    ForEach(shoppingListViewModel.shoppingList) { item in
                        ShoppingIngredientsView(product: item)
                    }
                    Spacer()
                    if !shoppingListViewModel.shoppingList.isEmpty {
                        Button("Place Order", action: {
                            isPresented = true
                        })
                        .padding(.trailing)
                        .font(.title)
                        .foregroundColor(.blue)
                        .fullScreenCover(isPresented: $isPresented) {
                            SummaryView()
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Shopping List"))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

@available(iOS 14.0, *)
struct ShoppingListView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingListView()
            .environmentObject(ShoppingListViewModel())
    }
}
