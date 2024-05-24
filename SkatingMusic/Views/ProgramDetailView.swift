import SwiftUI

struct ProgramDetailView: View {
    @Binding var program: Program
    
//    @State private var editingProgram
    @State private var isPresentingEditView = false
    
    var body: some View {
        List {
            Section(header: Text("Program info")) {
                Text(program.name)
//                HStack {
//                    Label("Duration", systemImage: "clock")
//                    Spacer()
//                    Text("\(program.totalLength)")
//                }
//                .accessibilityElement(children: .combine
//                )
//                HStack {
//                    Label("Theme", systemImage: "paintpalette")
//                    Spacer()
//                    Text(program.theme.name)
//                        .padding(4)
//                        .foregroundColor(program.theme.accentColor)
//                        .background(program.theme.mainColor)
//                        .cornerRadius(4)
//                }
//                .accessibilityElement(children: .combine
//                )
            }
            
            Section(header: Text("Music")) {
//                HStack {
                    Label("Lead in", systemImage: "clock")
//                    Spacer()
//                    Text("\(program.leadInSeconds) seconds")
//                }
//                NavigationLink(destination: MusicView(program: $program)) {
//                    Label("Start music", systemImage: "play")
//                        .font(.headline)
//                        .foregroundColor(.accentColor)
//                }
            }
            
//            Section(header: Text("History")) {
//                if program.history.isEmpty {
//                    Label("No history yet", systemImage: "calendar.badge.exclamationmark")
//                }
//                ForEach(program.history) { history in
//                    HStack {
//                        Image(systemName: "calendar")
//                        Text(history.date, style: .date)
//                    }
//                }
//            }
        }
        .navigationBarTitle(program.name)
        .navigationBarItems(trailing: Button("Edit") {
                isPresentingEditView = true
//                editingProgram = program
            
        })
        .sheet(isPresented: $isPresentingEditView) {
            Text(program.name)
//            NavigationStack {
//                ProgramDetailEditView(program: $editingProgram)
//                    .navigationTitle(program.name)
//                    .toolbar {
//                        ToolbarItem(placement: .cancellationAction) {
//                            Button("Cancel") {
//                                isPresentingEditView = false
//                            }
//                        }
//                        ToolbarItem(placement: .confirmationAction) {
//                            Button("Done") {
//                                isPresentingEditView = false
//                                program = editingProgram
//                            }
//                        }
//                    }
//            }
        }
    }
}

struct ProgramDetailView_Preview: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProgramDetailView(program: .constant(Program.sampleData()[0]))
        }
    }
}
