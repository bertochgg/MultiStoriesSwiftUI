//
//  ProgressBarStyle.swift
//  MultiStoriesSwiftUI
//
//  Created by Cesar Humberto Grifaldo Garcia on 31/10/25.
//

import SwiftUI

struct ColoredLinearProgressViewStyle: ProgressViewStyle {
    var fill: Color
    var track: Color
    var height: CGFloat = 8
    
    func makeBody(configuration: Configuration) -> some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                // Background (track)
                RoundedRectangle(cornerRadius: 0)
                    .fill(track)
                    .frame(height: height)
                // Foreground (progress fill)
                RoundedRectangle(cornerRadius: 0)
                    .fill(fill)
                    .frame(
                        width: geo.size.width * CGFloat(configuration.fractionCompleted ?? 0),
                        height: height
                    )
            }
        }
        .frame(height: height)
    }
}
