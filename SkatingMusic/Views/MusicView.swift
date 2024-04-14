//
//  ContentView.swift
//  SkatingMusic
//
//  Created by Tammy Liu on 4/4/24.
//

import SwiftUI

// TODO: add options for delay (metronome, silence, music extension?)
// TODO: add categories/tags for level (eg. adult pre-bronze, bronze, lyrical, etc)

struct MusicView: View {
    let program: Program
    
    var body: some View {
        VStack {
            ProgressView(value: 10, total: 15)
            HStack{
                VStack {
                    Text("Seconds elapsed").font(.caption)
                    Label("300", systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack {
                    Text("Seconds remaining").font(.caption)
                    Label("600", systemImage: "hourglass.bottomhalf.fill")
                }
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Time remaining")
            .accessibilityValue("10 minutes")
            Circle().strokeBorder(lineWidth: 24)
            HStack {
                Text("Speaker 1 of 3")
                Spacer()
                Button(action: {}) {
                    Image(systemName: "forward.fill")
                }
                .accessibilityLabel("Next speaker")
            }
        }
        .navigationBarTitle(program.title)
        .padding()
    }
}

struct MusicView_Preview: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MusicView(program: Program.sampleData[0])
        }
    }
}
