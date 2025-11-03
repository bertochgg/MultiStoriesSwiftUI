//
//  MultiStoriesSwiftUIApp.swift
//  MultiStoriesSwiftUI
//
//  Created by Cesar Humberto Grifaldo Garcia on 31/10/25.
//

import SwiftUI

@main
struct MultiStoriesSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(storyViews: [SomeView(), SomeView(), SomeView(), SomeView(), SomeView()])
        }
    }
}
