//
//  Program.swift
//  SkatingMusic
//
//  Created by Tammy Liu on 4/6/24.
//

import Foundation

struct Program: Identifiable {
    let id: UUID
    var title: String
    var level: String
    var leadInSeconds: Int
    var file: String
    var theme: Theme
    var tags: [String]
    
    var totalLength: String {
        return Duration.seconds(160)
            .formatted(.time(pattern: . minuteSecond(padMinuteToLength: 2)))
    }
    
    var leadInSecondsAsDouble: Double {
        get {
            Double(leadInSeconds)
        }
        set {
            leadInSeconds = Int(newValue)
        }
    }
    
    init(id: UUID = UUID(), title: String, level: String, leadInSeconds: Int, file: String, theme: Theme, tags: [String] = []) {
        self.id = id
        self.title = title
        self.level = level
        self.leadInSeconds = leadInSeconds
        self.file = file
        self.theme = theme
        self.tags = []
    }
}

extension Program {
    static var emptyProgram: Program {
        Program(title: "", level: "", leadInSeconds: 0, file: "", theme: .sky)
    }
}

extension Program {
    static let sampleData: [Program] =
    [
        Program(title: "White Night", level: "Adult Bronze", leadInSeconds: 3, file: "", theme: .periwinkle, tags: ["WIP"]),
        Program(title: "Hustle and Bustle of Ormos", level: "Adult Pre-bronze", leadInSeconds: 5, file: "",  theme: .yellow, tags: ["Spring show", "loop"]),
        Program(title: "Domineer", level: "Dance Pre-bronze", leadInSeconds: 10, file: "",  theme: .poppy)
    ]
}
