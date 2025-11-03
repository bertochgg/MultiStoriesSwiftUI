//
//  ProgressBar.swift
//  MultiStoriesSwiftUI
//
//  Created by Cesar Humberto Grifaldo Garcia on 31/10/25.
//

import SwiftUI

struct ProgressBar: View {
    var progress: CGFloat
    
    var body: some View {
        ProgressView(value: progress)
            .progressViewStyle(
                ColoredLinearProgressViewStyle(
                    fill: Color(red: 217/217, green: 217/217, blue: 217),
                    track: Color(red: 217/217, green: 217/217, blue: 217).opacity(0.4),
                    height: 3
                )
            )
    }
}

#Preview {
    ZStack {
        LinearGradient(colors: [.purple, .blue],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
        ProgressBar(progress: 0.3)
    }
}
