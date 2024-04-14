//
//  ListView.swift
//  SkatingMusic
//
//  Created by Tammy Liu on 4/10/24.
//

import SwiftUI

struct ListView: View {
    @Binding var programs: [Program]
    
    var body: some View {
        NavigationStack {
            List($programs) { $p in
                NavigationLink(destination: ProgramDetailView(program: $p)) {
                    CardView(program: p)
                }.listRowBackground(p.theme.mainColor)
            }
            .navigationTitle("Skating Music")
            .toolbar {
                Button(action: {}) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New program music")
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(programs: .constant(Program.sampleData))
    }
}
