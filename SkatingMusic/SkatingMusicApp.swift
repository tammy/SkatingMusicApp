//
//  SkatingMusicApp.swift
//  SkatingMusic
//
//  Created by Tammy Liu on 4/4/24.
//

import SwiftUI

@main
struct SkatingMusicApp: App {
    @StateObject private var store = ProgramStore()
    
    var body: some Scene {
        WindowGroup {
            ProgramListView(programs: $store.programs) {
                Task {
                    do {
                        try await store.save(programs: store.programs)
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
            }
                .task {
                    do {
                        try await store.load()
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
        }
    }
}
