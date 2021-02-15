
//
//  Created by mt on 11.05.2020.
//  Copyright © 2020 S3soft. All rights reserved.
//

import SwiftUI

struct ProductAnalyticsView: View {
    // MARK: - PROPERTIES
    
    var woodWorks: WoodWorks
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            HStack(alignment: .center, spacing: 2, content: {
                Image(systemName: "person.2")
                Text("Orders Placed: \(woodWorks.noOfPastOrders)")
            })
            HStack(alignment: .center, spacing: 2, content: {
                Image(systemName: "clock")
                Text("Views: \(woodWorks.totalVisits)\(unitNameViews)")
            })
/*
            HStack(alignment: .center, spacing: 2, content: {
                Image(systemName: "flame")
                Text("Cooking: \(woodworks.cooking)\(unitNameCooking)")
            })
 */
        }
        .font(.footnote)
        .foregroundColor(Color.gray)
    }
}

struct ProductAnalyticsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductAnalyticsView(woodWorks: sampleWorks[0])
            .previewLayout(.fixed(width: 320, height: 60))
    }
}
