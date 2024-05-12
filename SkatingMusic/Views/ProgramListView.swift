//
//  ListView.swift
//  SkatingMusic
//
//  Created by Tammy Liu on 4/10/24.
//

// Continue from: https://developer.apple.com/tutorials/app-dev-training/persisting-data

// and: https://developer.apple.com/documentation/swiftui/view/onchange(of:initial:_:)-8wgw9

import SwiftUI

struct ProgramListView: View {
    @Binding var programs: [Program]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewProgramView = false
    
    let saveAction: ()->Void
    
    var body: some View {
        NavigationStack {
            List($programs) { $p in
                NavigationLink(destination: ProgramDetailView(program: $p)) {
                    CardView(program: p)
                }.listRowBackground(p.theme.mainColor)
            }
            .navigationTitle("Skating Music")
            .toolbar {
                Button(action: {
                    isPresentingNewProgramView = true
                }) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New program music")
            }
        }
        .sheet(isPresented: $isPresentingNewProgramView) {
            NewProgramSheet(programs: $programs, isPresentingNewProgramView: $isPresentingNewProgramView)
        }
        .onChange(of: scenePhase) { phase in
            if phase == .inactive { saveAction() }
        }
    }
}

struct ProgramListView_Previews: PreviewProvider {
    static var previews: some View {
        ProgramListView(programs: .constant(Program.sampleData), saveAction: {})
    }
}
