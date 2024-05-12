import SwiftUI

struct MusicControlView: View {
    let isPlaying: Bool
    var playAction: ()->Void
    var pauseAction: ()->Void
    
    var body: some View {
        HStack {
            if (isPlaying) {
                Button(action: pauseAction) {
                    Image(systemName: "pause.fill")
                }
                .accessibilityLabel("pause")
            } else {
                Button(action: playAction) {
                    Image(systemName: "play.fill")
                }
                .accessibilityLabel("play")
            }
            
        }
        .padding([.bottom, .horizontal])
    }
}


struct MusicControlView_Previews: PreviewProvider {
    static var previews: some View {
        MusicControlView(isPlaying: true, playAction: {}, pauseAction: {})
            .previewLayout(.sizeThatFits)
    }
}
