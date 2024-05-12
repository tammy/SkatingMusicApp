//
//  DetailEditView.swift
//  SkatingMusic
//
//  Created by Tammy Liu on 4/13/24.
//

import SwiftUI

struct ProgramDetailEditView: View {
    @Binding var program: Program
    
    var body: some View {
        Form {
            Section(header: Text("Program info")) {
                TextField("Title", text: $program.title)
                TextField("Program level", text: $program.label)
                
                HStack{
                    Text("Music lead in")
                    Slider(value: $program.leadInSecondsAsDouble, in: 1...30, step: 1) {
                        Text("Length")
                    }
                    Spacer()
                    Text("\(program.leadInSeconds) seconds")
                        .accessibilityHidden(true)
                }
                ThemePicker(selection: $program.theme)
            }
        }
    }
}

struct ProgramDetailEditView_Preview: PreviewProvider {
    static var previews: some View {
        ProgramDetailEditView(program: .constant(Program.sampleData[0]))
    }
}
