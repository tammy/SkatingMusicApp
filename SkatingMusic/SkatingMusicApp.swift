//
//  SkatingMusicApp.swift
//  SkatingMusic
//
//  Created by Tammy Liu on 4/4/24.
//

import SwiftUI

@main
struct SkatingMusicApp: App {
    @State private var programs = Program.sampleData
    
    var body: some Scene {
        WindowGroup {
            ListView(programs: $programs)
        }
    }
}
