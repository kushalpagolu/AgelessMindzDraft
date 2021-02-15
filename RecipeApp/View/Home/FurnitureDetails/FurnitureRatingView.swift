//
//  Created by mt on 11.05.2020.
//  Copyright © 2020 S3soft. All rights reserved.
//

import SwiftUI

struct FurnitureRatingView: View {
    // MARK: - PROPERTIES
    
    var woodWorks: WoodWorks
    
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            ForEach(1...(woodWorks.rating), id: \.self) { _ in
                Image(systemName: "star.fill")
                    .font(.body)
                    .foregroundColor(Color.yellow)
            }
        }
    }
}

struct FurnitureRatingView_Previews: PreviewProvider {
    static var previews: some View {
        FurnitureRatingView(woodWorks: sampleWorks[0])
            .previewLayout(.fixed(width: 320, height: 60))
    }
}
