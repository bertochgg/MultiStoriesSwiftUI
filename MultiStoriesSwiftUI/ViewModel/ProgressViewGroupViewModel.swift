//
//  ProgressViewGroupViewModel.swift
//  MultiStoriesSwiftUI
//
//  Created by Cesar Humberto Grifaldo Garcia on 31/10/25.
//

import SwiftUI
import Combine
import QuartzCore

@MainActor
final class ProgressViewGroupViewModel: ObservableObject {
    @Published var currentIndex: Int = 0
    @Published var progressValue: CGFloat = 0.0
    private var displayLink: CADisplayLink?
    private var duration: TimeInterval = 5
    private var startDate: Date?
    private var totalStories: Int = 0
    
    func startStories(amount: Int, duration: TimeInterval = 5) {
        self.totalStories = amount
        self.duration = duration
        self.currentIndex = 0
        self.progressValue = 0.0
        self.startDate = Date()
        stopProgress()
        displayLink = CADisplayLink(target: self, selector: #selector(updateProgress))
        displayLink?.add(to: .main, forMode: .common)
    }
    
    func stopProgress() {
        displayLink?.invalidate()
        displayLink = nil
    }
    
    func pauseProgress() {
        displayLink?.isPaused = true
    }
    
    func resumeProgress() {
        startDate = Date().addingTimeInterval(-progressValue * duration)
        displayLink?.isPaused = false
    }
    
    func progress(for index: Int) -> Double {
        if index < currentIndex {
            return 1.0
        } else if index == currentIndex {
            return progressValue
        } else {
            return 0.0
        }
    }
    
    func nextStory() {
        guard currentIndex < totalStories - 1 else { return }
        currentIndex += 1
        progressValue = 0
        startDate = Date()
    }
    
    func previousStory() {
        guard currentIndex > 0 else { return }
        currentIndex -= 1
        progressValue = 0
        startDate = Date()
    }
    
    @objc private func updateProgress() {
        guard let startDate else { return }
        let elapsed = Date().timeIntervalSince(startDate)
        progressValue = min(elapsed / duration, 1.0)
        
        if progressValue >= 1.0 {
            if currentIndex < totalStories - 1 {
                currentIndex += 1
                progressValue = 0
                self.startDate = Date()
            } else {
                stopProgress()
            }
        }
    }
    
}
