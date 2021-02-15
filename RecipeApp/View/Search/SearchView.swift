//
//  SearchView.swift
//
//  Created by muhammed on 11/12/2020.
//  Copyright © 2020 S3soft. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var searchVM = SearchViewModel()
    @ObservedObject var searchManager = SearchDataManager.shared
    
    var body: some View {
        VStack {
            SearchBarView(text: $searchVM.searchText, isEditing: $searchVM.isSearching)
                .padding(.vertical, 10)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 20) {
                    
                    ForEach(searchManager.woodWorksList) { item in
                        FurnitureCardView(woodWorks: item)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 160)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
