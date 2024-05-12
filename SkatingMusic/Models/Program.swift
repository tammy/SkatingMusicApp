//
//  Program.swift
//  SkatingMusic
//
//  Created by Tammy Liu on 4/6/24.
//

import Foundation

struct Program: Identifiable, Codable {
    let id: UUID
    var title: String
    var label: String
    var leadInSeconds: Int
    var file: String
    var theme: Theme
    var tags: [String] = []
    var history: [History] = []
    
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
    
    init(id: UUID = UUID(), title: String, label: String, leadInSeconds: Int, file: String, theme: Theme) {
        self.id = id
        self.title = title
        self.label = label
        self.leadInSeconds = leadInSeconds
        self.file = file
        self.theme = theme
    }
}

extension Program {
    static var emptyProgram: Program {
        Program(title: "", label: "", leadInSeconds: 0, file: "", theme: .sky)
    }
}

extension Program {
    static let sampleData: [Program] =
    [
        Program(title: "White Night", label: "Adult Bronze", leadInSeconds: 3, file: "", theme: .periwinkle),
        Program(title: "Hustle and Bustle of Ormos", label: "Adult Pre-bronze", leadInSeconds: 5, file: "",  theme: .yellow),
        Program(title: "Domineer", label: "Dance Pre-bronze", leadInSeconds: 10, file: "",  theme: .poppy)
    ]
}
