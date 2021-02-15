//
//  InstructionsView.swift
//
//  Created by mt on 18.05.2020.
//  Copyright © 2020 S3soft. All rights reserved.
//

import SwiftUI

struct InstructionsView: View {
    
    // MARK: - PROPERTIES
    var overview: [String]
    var woodWorks: WoodWorks
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
        
            HStack {
                Spacer()
                Text("Overview")
                    .modifier(BoxTitleModifier())
                Spacer()
            }
                
            ForEach(woodWorks.overview, id: \.self) { item in
                HStack(alignment: .center, spacing: 5) {
                    Image(systemName: "chevron.right")
                        .resizable()
                        .frame(width: 15, height: 25, alignment: .center)
                        .imageScale(.large)
                        .font(Font.title.weight(.ultraLight))
                        .foregroundColor(Color.gray)
                    Text(item)
                        .lineLimit(nil)
                        .multilineTextAlignment(.leading)
                        .font(.system(.body, design: .default))
                        .fixedSize(horizontal: false, vertical: true)

                }
                .padding(.vertical, 10)
            }
        }
        .modifier(BoxBackgroundModifier())
    }
}

struct InstructionsView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionsView(overview: sampleWorks[0].overview, woodWorks: sampleWorks[0])
    }
}
