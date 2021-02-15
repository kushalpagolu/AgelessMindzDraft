//
//
//  Created by mt on 18.05.2020.
//  Copyright © 2020 S3soft. All rights reserved.
//

import SwiftUI

struct ProductDescriptionView: View {   
    // MARK: - PROPERTIES
    var woodWorks: WoodWorks
    @State private var showAlertIngredient: Bool = false
    @EnvironmentObject var shoppingListViewModel: ShoppingListViewModel
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            HStack {
                Spacer()
                Text("Description")
                    .modifier(BoxTitleModifier())
                Spacer()
            }
            HStack {
                Button(action: {
                    self.shoppingListViewModel.addProductToShoppingList(woodWorks: self.woodWorks)
                    self.showAlertIngredient.toggle()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        self.showAlertIngredient.toggle()
                    }
                }) {
                    HStack {
                        Image(systemName: "cart.badge.plus")
                        Text("Add to shopping list")
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(40)
                    .shadow(color: Color("ColorBlackTransparentLight"), radius: 5, x: 1, y: 2)
                }
                .alert(isPresented: $showAlertIngredient) {
                    Alert(
                        title: Text("Successful"),
                        message: Text("Product saved to Shopping List"),
                        dismissButton: .default(Text("Ok"))
                    )
                }
            }

            VStack (alignment: .leading, spacing: 5) {
                ForEach(woodWorks.product, id: \.self) { item in
                    VStack (alignment: .leading, spacing: 5) {
                        Text(item)
                            .font(.footnote)
                            .multilineTextAlignment(TextAlignment.leading)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        
                        Divider()
                    }
                }
                
            }
        }
        .modifier(BoxBackgroundModifier())
    }
}

struct ProductDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDescriptionView(woodWorks: sampleWorks[0])
    }
}
