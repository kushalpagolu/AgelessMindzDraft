
//
//  Created by mt on 15.05.2020.
//  Copyright © 2020 S3soft. All rights reserved.
//

import Foundation

// MARK: - FURNITURE DATA

final class FurnitureListViewModel: ObservableObject {
    
    @Published var dataIsLoading: Bool = false
    @Published var dataEditorChoiceIsLoading: Bool = false
    @Published var dataTrendingIsLoading: Bool = false
    @Published var woodWorksData: [WoodWorks] = []
    @Published var editorWoodWorksData: [WoodWorks] = []
    @Published var trendingWoodWorksData: [WoodWorks] = []
    
    init() {
        readAllData()
    }
    
    func readAllData() {
        
        self.dataIsLoading = true
        self.dataEditorChoiceIsLoading = true
        self.dataTrendingIsLoading = true
        self.woodWorksData = []
        self.editorWoodWorksData = []
        self.trendingWoodWorksData = []
        self.woodWorksData = sampleWorks
        
        SearchDataManager.shared.setOriginalList(list: self.woodWorksData)
        
        for woodWorks in self.woodWorksData {
            // Add editor's list if flag true
            if woodWorks.isEditorChoice {
                self.editorWoodWorksData.append(woodWorks)
            }
            // Add trendings's list if flag true
            if woodWorks.isTrending {
                self.trendingWoodWorksData.append(woodWorks)
            }
        }
        
        self.dataIsLoading = false
        self.dataEditorChoiceIsLoading = false
        self.dataTrendingIsLoading = false
    }
    
}

