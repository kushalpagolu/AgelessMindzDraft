//
//  SummaryView.swift
//  AgelessMindz
//
//  Created by Kushal P on 2/14/21.
//  Copyright © 2021 S3soft. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
struct SummaryView: View {
   // @State var product: Product? = nil
    @EnvironmentObject var shoppingListViewModel: ShoppingListViewModel
    @State private var isPresented = false
    @Environment(\.presentationMode) var presentationMode
    
    @State private var comment : String = ""
    
    // example of how UUID() is used as Order no.
    // it'll be different everytime when this view is opened
    @State private var orderNo : String = UUID().uuidString
    var body: some View {
        NavigationView {
           
                List{
                    Section(header: Text("Order No:")){
                        Text("\(orderNo)")
                        .font(.caption)
                    }
                    Section(header: Text("Your Order Summary")){
                        
                        // loop the items in shoppingListViewModel
                        ForEach(shoppingListViewModel.shoppingList)
                        { item in
                            Text("Product : \(item.title)")
                            //TextField("Product :", text: $)
                        }
                    }
                    Section(header: Text("COMMENTS")) {
                        TextField("Type Your Comment Here", text: $comment)
                    }
                    HStack {
                     //   TextField("Additional Comments")
                        Button(action: {
                        }) {
                            Text("Proceed")
                                .bold()
                                .accessibilityLabel(Text("Proceed to Place your Order"))
                            //Image(systemName: "plus.circle.fill")
                              //
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
                .navigationBarItems(trailing: Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                })
        }
    }
}


@available(iOS 14.0, *)
struct SummaryView_Previews: PreviewProvider {
    @available(iOS 14.0, *)
    static var previews: some View {
        SummaryView()//product: Product(title: "Pizza", items: [ProductItem(name: "Desk", done: true), ProductItem(name: "Chair", done: false)]))
            .environmentObject(ShoppingListViewModel())
            .previewLayout(.sizeThatFits)
    }
}
