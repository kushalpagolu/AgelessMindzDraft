
//  Created by mt on 11.05.2020.
//  Copyright © 2020 S3soft. All rights reserved.
//

import SwiftUI

// MARK: - WoodWorks MODEL

struct WoodWorks: Identifiable, Codable, Equatable {
    var id = UUID()
    var title: String
    var comments: String
    var calories: Int
    var fat: Int
    var satfat: Int
    var carbs: Int
    var fiber: Int
    var sugar: Int
    var protein: Int
    var image: String
    var rating: Int
    var noOfPastOrders: Int
    var totalVisits: Int
    var cooking: Int
    var overview: [String]
    var product: [String]
    var isEditorChoice: Bool
    var isTrending: Bool
}
