//
//  TapGesturesView.swift
//  MultiStoriesSwiftUI
//
//  Created by Cesar Humberto Grifaldo Garcia on 01/11/25.
//

import SwiftUI

struct StoryGestureView: View {
    var onPrevious: () -> Void
    var onNext: () -> Void
    var onPause: () -> Void
    var onResume: () -> Void
    
    // how long counts as “hold to pause”
    private let holdThreshold: TimeInterval = 0.2
    
    @State private var pressStart: Date? = nil
    @State private var hasPausedThisPress = false
    
    var body: some View {
        GeometryReader { proxy in
            Color.clear
                .contentShape(Rectangle())
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged { _ in
                            // first touch down
                            if pressStart == nil {
                                pressStart = Date()
                                hasPausedThisPress = true
                                onPause()           // pause immediately on touch down
                            }
                        }
                        .onEnded { value in
                            defer {
                                // reset state & resume
                                pressStart = nil
                                hasPausedThisPress = false
                                onResume()
                            }
                            
                            let duration = pressStart.map { Date().timeIntervalSince($0) } ?? 0
                            let isTap = duration < holdThreshold
                            
                            guard isTap else {
                                // it was a hold: we already paused; just resume via defer
                                return
                            }
                            
                            // quick tap: route to next/previous by tap location
                            let tapX = value.location.x
                            if tapX < proxy.size.width / 2 {
                                onPrevious()
                            } else {
                                onNext()
                            }
                        }
                )
        }
        .ignoresSafeArea()
    }
}


