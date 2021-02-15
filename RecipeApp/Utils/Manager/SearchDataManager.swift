//
//  SearchDataManager.swift
//
//  Created by muhammed on 11/12/2020.
//  Copyright © 2020 S3soft. All rights reserved.
//

import Foundation

class SearchDataManager: ObservableObject {
    
    static let shared = SearchDataManager()
    
    @Published var woodWorksList = [WoodWorks]()
    
    var originalWoodWorksList = [WoodWorks]()
    
    func setOriginalList(list:[WoodWorks]) {
        self.originalWoodWorksList = list
        self.woodWorksList = list
    }
    
    func resetToOriginal() {
        if woodWorksList.count != originalWoodWorksList.count {
            woodWorksList = originalWoodWorksList
        }
    }
    
    func setEmpty() {
        if !woodWorksList.isEmpty {
            woodWorksList.removeAll()
        }
    }
    
    func search(text: String) {
        woodWorksList = originalWoodWorksList.filter{ $0.title.lowercased().contains(text.lowercased()) }
    }
}
