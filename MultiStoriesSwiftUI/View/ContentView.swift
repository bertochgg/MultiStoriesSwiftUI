//
//  ContentView.swift
//  MultiStoriesSwiftUI
//
//  Created by Cesar Humberto Grifaldo Garcia on 31/10/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var progressGroupViewModel = ProgressViewGroupViewModel()
    let storyViews: [any View]
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .purple]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                ProgressViewGroup(progressGroupViewModel: progressGroupViewModel,
                                  stories: storyViews.count)
                    .padding(.top, 20)
                Button("Some Button") {
                    print("Some action")
                }
                .buttonStyle(.glassProminent)
                .contentShape(Capsule())
                Spacer()
            }
            
            .padding()
            .onAppear {
                progressGroupViewModel.startStories(amount: storyViews.count, duration: 5.0)
            }
            StoryGestureView(onPrevious: progressGroupViewModel.previousStory,
                             onNext: progressGroupViewModel.nextStory,
                             onPause: progressGroupViewModel.pauseProgress,
                             onResume: progressGroupViewModel.resumeProgress)
        }
    }
}

#Preview {
    ZStack {
        LinearGradient(gradient: Gradient(colors: [.blue, .purple]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .ignoresSafeArea()
        ContentView(storyViews: [SomeView(), SomeView(), SomeView(), SomeView(), SomeView()])
//        ContentView2()
    }
}

struct SomeView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
