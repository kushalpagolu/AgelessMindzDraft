//
//  NutritionalView.swift
//
//  Created by mt on 18.05.2020.
//  Copyright © 2020 S3soft. All rights reserved.
//

import SwiftUI

struct ProductDetailsView: View {
    
    // MARK: - PROPERTIES
    var woodWorks: WoodWorks
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 10) {
            
            HStack {
                Spacer()
                Text("Details")
                    .modifier(BoxTitleModifier())
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 10) {
               HStack(alignment: .center, spacing: 10) {
                    NutritionalItemView(value: woodWorks.calories, name: unitNameCalories, unitName:"")
                    NutritionalItemView(value: woodWorks.fat, name: "fat", unitName:unitNameFat)
                    NutritionalItemView(value: woodWorks.satfat, name: "satfat", unitName:unitNameSatfat)
                    NutritionalItemView(value: woodWorks.carbs, name: "carbs", unitName:unitNameCarbs)
               }
               HStack(alignment: .center, spacing: 10) {
                    NutritionalItemView(value: woodWorks.fiber, name: "fiber", unitName:unitNameFiber)
                    NutritionalItemView(value: woodWorks.sugar, name: "sugar", unitName:unitNameSugar)
                    NutritionalItemView(value: woodWorks.protein, name: "protein", unitName:unitNameProtein)
               }
            }
        }
        .modifier(BoxBackgroundModifier())
        
    }
}

struct NutritionalView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProductDetailsView(woodWorks: sampleWorks[0]).colorScheme(.light)
            ProductDetailsView(woodWorks: sampleWorks[0]).colorScheme(.dark)
        }
    }
}
