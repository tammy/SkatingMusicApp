//
//  MusicTimer.swift
//  SkatingMusic
//
//  Created by Tammy Liu on 4/13/24.
//

import Foundation

@MainActor
final class MusicTimer: ObservableObject {
    
    @Published var secondsElapsed = 0
    @Published var secondsRemaining = 0
    
    private(set) var lengthInSeconds: Int
    
    var secondPassedAction: (() -> Void)?
    
    private weak var timer: Timer?
    private var timerStopped = false
    private var frequency: TimeInterval { 1.0 / 60.0 }
    private var startDate: Date?
    
    init(lengthInSeconds: Int = 0) {
        self.lengthInSeconds = lengthInSeconds
        secondsRemaining = lengthInSeconds
    }
    
    func startMusic() {
        timer = Timer.scheduledTimer(withTimeInterval: frequency, repeats: true) { [weak self] timer in
            self?.update()
        }
        timer?.tolerance = 0.1
        startDate = Date()
        timerStopped = false
    }
    
    func stopMusic() {
        timer?.invalidate()
        timerStopped = true
    }
    
    nonisolated private func update() {
        Task { @MainActor in
            guard let startDate, !timerStopped else { return }
            let secondsElapsed = Int(Date().timeIntervalSince1970 - startDate.timeIntervalSince1970)
            self.secondsElapsed = secondsElapsed
            
            secondsRemaining = max(lengthInSeconds - self.secondsElapsed, 0)
            
            if secondsElapsed >= 1 {
                secondPassedAction?()
            }
        }
    }
    
    func reset(lengthInSeconds: Int) {
        self.lengthInSeconds = lengthInSeconds
        secondsRemaining = lengthInSeconds
    }
}
