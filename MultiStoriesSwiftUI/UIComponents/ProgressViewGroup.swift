//
//  ProgressViewGroup.swift
//  MultiStoriesSwiftUI
//
//  Created by Cesar Humberto Grifaldo Garcia on 31/10/25.
//

import SwiftUI

struct ProgressViewGroup: View {
    @ObservedObject var progressGroupViewModel: ProgressViewGroupViewModel
    var stories: Int
    var body: some View {
        HStack {
            ForEach(0..<stories, id: \.self) { index in
                ProgressBar(progress: progressGroupViewModel.progress(for: index))
            }
        }
        .padding()
    }
}

#Preview {
    ZStack {
        LinearGradient(colors: [.purple, .blue],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
        ProgressViewGroup(progressGroupViewModel: ProgressViewGroupViewModel(),
                          stories: 3)
    }
}
