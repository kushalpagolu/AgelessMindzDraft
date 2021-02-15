//
//  ShoppingIngredientsView.swift
//
//  Created by mt on 14.05.2020.
//  Copyright © 2020 S3soft. All rights reserved.
//

import SwiftUI

struct ShoppingIngredientsView: View {
    // MARK: - PROPERTIES
    var product: Product
    var hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    @State var showPopover = false
    @State private var isPresented = false
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var shoppingListViewModel: ShoppingListViewModel
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 20) {
            HStack(alignment: .center, spacing: 10) {
                Text(product.title)
                Spacer()
                Button(action: {
                    if let index = self.shoppingListViewModel.shoppingList.firstIndex(where: { $0.id == self.product.id }) {
                        self.shoppingListViewModel.removeProductFromShoppingList(productIndex: index)
                    }
                }) {
                    Image(systemName: "trash.circle")
                        .imageScale(.large)
                        .foregroundColor(Color.red)
                }
            }
            
/*            VStack(alignment: .center, spacing: 10) {
                ForEach(product.items) { item in
                    CheckboxView(
                        id: item.id,
                        label: item.name,
                        done: item.done,
                        imageSize: 18,
                        textSize: 14,
                        callback: self.checkboxSelected
                    )
                }
            }
 */
        }
        .padding(.horizontal)
        if #available(iOS 14.0, *) {
            
        } else {
            // Fallback on earlier versions
        }
    }
    
    func checkboxSelected(id: UUID, isMarked: Bool) {
        hapticImpact.impactOccurred()
        if let index = shoppingListViewModel.shoppingList.firstIndex(where: { $0.id == product.id }) {
            shoppingListViewModel.setDoneOfIngredientItem(productIndex: index, productItemId: id, done: isMarked)
        }
    }
}

struct ShoppingIngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingIngredientsView(product: Product(title: "Pizza", items: [ProductItem(name: "Desk", done: true), ProductItem(name: "Chair", done: false)]))
            .environmentObject(ShoppingListViewModel())
            .previewLayout(.sizeThatFits)
    }
}
