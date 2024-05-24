import AVFoundation

class AudioPlayer: ObservableObject {
    var audioPlayer: AVAudioPlayer?

    func playAudio(from url: URL) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error playing audio: \(error)")
        }
    }

    func stopAudio() {
        audioPlayer?.stop()
    }

    func getAudioDuration(from url: URL) -> TimeInterval? {
        do {
            let audioPlayer = try AVAudioPlayer(contentsOf: url)
            return audioPlayer.duration
        } catch {
            print("Error getting audio duration: \(error)")
            return nil
        }
    }
}
