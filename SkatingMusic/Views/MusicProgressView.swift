//
//  MusicHeaderView.swift
//  SkatingMusic
//
//  Created by Tammy Liu on 4/13/24.
//

import SwiftUI

struct MusicProgressView: View {
    let secondsElapsed: Int
    let secondsRemaining: Int
    let theme: Theme
    
    private var totalSeconds: Int {
        secondsElapsed + secondsRemaining
    }
    
    private var progress: Double {
        guard totalSeconds > 0 else { return 1 }
        return Double(secondsElapsed) / Double (totalSeconds)
    }
    
    var body: some View {
        VStack {
            ProgressView(value: progress)
                .progressViewStyle(MusicProgressViewStyle(theme: theme))
            HStack{
                VStack {
                    Text("Seconds elapsed").font(.caption)
                    Label("\(secondsElapsed)", systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack {
                    Text("Seconds remaining").font(.caption)
                    Label("\(secondsRemaining)", systemImage: "hourglass.bottomhalf.fill")
                        .labelStyle(.trailingIcon)
                }
            }
        }
        .accessibilityElement(children: .ignore)
        .padding([.top, .horizontal])
    }
}

struct MusicProgressView_Previews: PreviewProvider {
    static var previews: some View {
        MusicProgressView(secondsElapsed: 10, secondsRemaining: 5, theme: .periwinkle)
            .previewLayout(.sizeThatFits)
    }
}
