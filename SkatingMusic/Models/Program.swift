import Foundation
import AVFoundation

enum LeadInType: Codable {
    case none
    case metronome
}

struct Program: Identifiable, Codable {
    let id: UUID
    var name: String
    var audioFileURL: URL
    let duration: TimeInterval

    // TODO: use these
    var useLeadIn: Bool
    var leadInType: LeadInType
    var leadInDuration: TimeInterval
//    var theme: Theme?
//    var history: [History] = []
    
    init(id: UUID = UUID(), name: String = "", audioFileURL: URL, duration: TimeInterval, useLeadIn: Bool = false, leadInType: LeadInType = LeadInType.none, leadInDuration: TimeInterval = 0) {
        self.id = id
        self.name = name
        self.audioFileURL = audioFileURL
        self.duration = duration
        self.useLeadIn = useLeadIn
        self.leadInType = leadInType
        self.leadInDuration = leadInDuration
    }
    
    private func durationToString() -> String {
        let minutes = Int(self.duration) / 60
        let seconds = Int(self.duration) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

extension Program {
    static func sampleData() -> [Program] {
        let programURL1 = URL(fileURLWithPath: Bundle.main.path(forResource: "Hustle and Bustle of Ormos - Tammy’s Program", ofType: "mp3") ?? "")
        let programURL2 = URL(fileURLWithPath: Bundle.main.path(forResource: "WHITE NIGHT", ofType: "mp3") ?? "")
        let programURL3 = URL(fileURLWithPath: Bundle.main.path(forResource: "Domineer", ofType: "mp3") ?? "")

        return [
            Program(name: "Hustle and Bustle of Ormos", audioFileURL: programURL1, duration: 120, useLeadIn: true, leadInDuration: 5),
            Program(name: "White Night", audioFileURL: programURL2, duration: 150, useLeadIn: true, leadInDuration: 10),
            Program(name: "Domineer", audioFileURL: programURL3, duration: 180)
        ]
    }
}
