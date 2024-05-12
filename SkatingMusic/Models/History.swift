//
//  History.swift
//  SkatingMusic
//
//  Created by Tammy Liu on 4/14/24.
//

import Foundation

struct History: Identifiable, Codable {
    let id: UUID
    let date: Date
    
    init(id: UUID = UUID(), date: Date = Date()) {
        self.id = id
        self.date = date
    }
}
