//
//  ProgramStore.swift
//  SkatingMusic
//
//  Created by Tammy Liu on 4/14/24.
//

import SwiftUI

@MainActor
class ProgramStore: ObservableObject {
    @Published var programs: [Program] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("programs.data")
    }
    
    func load() async throws {
        let task = Task<[Program], Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            let programs = try JSONDecoder().decode([Program].self, from: data)
            return programs
        }
        let programs = try await task.value
        self.programs = programs
    }
    
    func save(programs: [Program]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(programs)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
}

