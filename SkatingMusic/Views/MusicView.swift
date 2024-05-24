//import SwiftUI
//import AVFoundation
//
//struct MusicView: View {
//    @Binding var program: Program
////    @StateObject var musicTimer = MusicTimer()
////    @State var music = program.musicURL
//    
//    
////    @StateObject private var audioManager = AudioPlayerManager()
////    private var player: AVPlayer { AVPlayer.sharedDingPlayer }
//    
//    var body: some View {
//        ZStack {
////            RoundedRectangle(cornerRadius: 16.0)
////                .fill(program.theme.mainColor)
////            VStack {
////                Circle().strokeBorder(lineWidth: 24)
////                MusicProgressView(secondsElapsed: musicTimer.secondsElapsed, secondsRemaining: musicTimer.secondsRemaining, theme: program.theme)
////                MusicControlView(isPlaying: isPlaying, playAction: playMusic, pauseAction: pauseMusic)
////            }
//        }
////        .padding()
////        .foregroundColor(program.theme.accentColor)
////        .onAppear {
////            startProgram()
////        }
////        .onDisappear {
////            endProgram()
////        }
//        VStack {
//            var musicURL = program.musicURL
//            Button(action: {
//                if self.audioManager.isPlaying {
//                    self.audioManager.stopPlayback()
//                } else {
//                    if let fileURL = Bundle.main.url(forResource: musicURL?.absoluteString, withExtension: musicURL?.pathExtension) {
//                        self.audioManager.startPlayback(fileURL: fileURL)
//                    }
//                }
//            }) {
//                Image(systemName: audioManager.isPlaying ? "stop.fill" : "play.fill")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 50, height: 50)
//            }
//            
//            Button("Play Remote File") {
//                let remoteURL = musicURL!
//                audioManager.startPlaybackFromRemoteURL(url: remoteURL)
//            }
//        }
//        .padding()
//        .navigationBarTitle(program.title)
//        .navigationBarTitleDisplayMode(.inline)
//    }
//    
//
////    func stopPlayback() {
////        mainPlayer?.stop()
////        isPlaying = false
////    }
////    private func playMusic(music: URL) {
////        do {
////            mainPlayer = try AVAudioPlayer(contentsOf: music)
////            mainPlayer?.delegate = self
////            mainPlayer?.play()
////            isPlaying = true
////        } catch {
////            print("Playback failed.")
////        }
////    }
//    
////    private func pauseMusic() {
////        isPlaying = false
////        musicTimer.stopMusic()
////    }
//    
//    private func startProgram() {
////        musicTimer.reset(lengthInSeconds: program.leadInSeconds)
////        musicTimer.secondPassedAction = {
////            player.seek(to: .zero)
////            player.play()
////        }
////        playMusic(music: program.musicURL)
//    }
//    
//    private func endProgram() {
////        pauseMusic()
////        let newHistory = History()
////        program.history.insert(newHistory, at: 0)
//    }
//}
//
//struct MusicView_Preview: PreviewProvider {
//    static var previews: some View {
//        NavigationStack {
//            MusicView(program: .constant(Program.sampleData[0]))
//        }
//    }
//}
