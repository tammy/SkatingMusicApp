//
//  ContentView.swift
//  SkatingMusic
//
//  Created by Tammy Liu on 4/4/24.
//

import SwiftUI
import AVFoundation

struct MusicView: View {
    @Binding var program: Program
    @StateObject var musicTimer = MusicTimer()
    
    @State private var isPlaying = true
    private var player: AVPlayer { AVPlayer.sharedDingPlayer }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(program.theme.mainColor)
            VStack {
                Circle().strokeBorder(lineWidth: 24)
                MusicProgressView(secondsElapsed: musicTimer.secondsElapsed, secondsRemaining: musicTimer.secondsRemaining, theme: program.theme)
                MusicControlView(isPlaying: isPlaying, playAction: playMusic, pauseAction: pauseMusic)
            }
        }
        .padding()
        .foregroundColor(program.theme.accentColor)
        .onAppear {
            startProgram()
        }
        .onDisappear {
            endProgram()
        }
        .navigationBarTitle(program.title)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func playMusic() {
        isPlaying = true
        musicTimer.startMusic()
    }
    
    private func pauseMusic() {
        isPlaying = false
        musicTimer.stopMusic()
    }
    
    private func startProgram() {
        musicTimer.reset(lengthInSeconds: program.leadInSeconds)
        musicTimer.secondPassedAction = {
            player.seek(to: .zero)
            player.play()
        }
        playMusic()
    }
    
    private func endProgram() {
        pauseMusic()
        let newHistory = History()
        program.history.insert(newHistory, at: 0)
    }
}

struct MusicView_Preview: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MusicView(program: .constant(Program.sampleData[0]))
        }
    }
}
