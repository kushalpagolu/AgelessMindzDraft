//
//  ShoppingListViewModel.swift
//
//  Created by mt on 14.05.2020.
//  Copyright © 2020 S3soft. All rights reserved.
//

import SwiftUI

final class ShoppingListViewModel: ObservableObject {
    @Published var shoppingList: [Product] = []
    let defaults = UserDefaults.standard
    init() {
        let data = defaults.data(forKey: keyShoppingList)
        if (data != nil) {
            shoppingList = try! JSONDecoder().decode([Product].self, from: data!)
        }
    }
}

extension ShoppingListViewModel {
    func addProductToShoppingList(woodWorks: WoodWorks) {
        var productItemList: [ProductItem] = []
        for item in woodWorks.product {
            productItemList.append(ProductItem(name: item, done: false))
        }
        shoppingList.append(Product(title: woodWorks.title, items: productItemList))
        saveShoppingList()
    }
    func removeProductFromShoppingList(productIndex: Int) {
        shoppingList.remove(at: productIndex)
        saveShoppingList()
    }
    private func saveShoppingList() {
        let data = try! JSONEncoder().encode(shoppingList)
        defaults.set(data, forKey: keyShoppingList)
    }
    func setDoneOfIngredientItem(productIndex: Int, productItemId: UUID, done: Bool) {
        
        if let ingredientItem = shoppingList[productIndex].items.first(where: {$0.id == productItemId}) {
             if let itemIndex = shoppingList[productIndex].items.firstIndex(where: { $0.id == ingredientItem.id }) {
                 shoppingList[productIndex].items[itemIndex].done = done
                 saveShoppingList()
             }
        }
        
    }
}

