import SwiftUI

struct ProgramDetailEditView: View {
    @Binding var programs: [Program]
    @State private var newProgramName: String = ""
    @State private var selectedFileURL: URL?
    @StateObject private var audioPlayer = AudioPlayer()
    @State private var isPickerPresented: Bool = false
    var programToEdit: Program?

    var body: some View {
        Form {
            Section(header: Text("Program info")) {
                HStack {
                    TextField("Enter name", text: $newProgramName)
                }
                .overlay(
                    HStack {
                        Spacer()
                        if newProgramName.isEmpty {
                            Text("*")
                                .foregroundColor(.red)
                                .padding(.trailing, 5)
                        }
                    }
                )
            }
            
            Section(header: Text("Music")) {
                HStack {
                    if selectedFileURL != nil {
                        if let fileName = selectedFileURL?.lastPathComponent {
                            Button(action: {
                                isPickerPresented = true
                            }) {
                                Label(fileName, systemImage: "music.note")
                            }
                            .sheet(isPresented: $isPickerPresented) {
                                DocumentPicker(selectedFileURL: $selectedFileURL)
                            }
                        }
                        
                    } else {
                        Button(action: {
                            isPickerPresented = true
                        }) {
                            Label("Select audio file", systemImage: "folder")
                        }
                        .sheet(isPresented: $isPickerPresented) {
                            DocumentPicker(selectedFileURL: $selectedFileURL)
                        }
                    }
                    Spacer()
                    if selectedFileURL == nil {
                        Text("*")
                            .foregroundColor(.red)
                            .padding(.trailing, 5)
                    }
                }
            }
        }
        .onAppear {
            if let program = programToEdit {
                newProgramName = program.name
                selectedFileURL = program.audioFileURL
            }
        }
        .navigationTitle(programToEdit == nil ? "New Program" : "Edit Program")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button("Save", action: saveProgram).disabled(!isSaveButtonEnabled()))
    }
    
    private func isSaveButtonEnabled() -> Bool {
        return newProgramName != "" && selectedFileURL != nil
    }
    

    private func saveProgram() {
        guard let url = selectedFileURL, !newProgramName.isEmpty else { return }

        let newProgram = Program(id: programToEdit?.id ?? UUID(), name: newProgramName, audioFileURL: url, duration: audioPlayer.getAudioDuration(from: url) ?? 0)

        if let program = programToEdit {
            if let index = programs.firstIndex(where: { $0.id == program.id }) {
                programs[index] = newProgram
            }
        } else {
            programs.append(newProgram)
        }
    }
}

struct ProgramDetailEditView_Previews: PreviewProvider {
    @State static var programs: [Program] = Program.sampleData()

    static var previews: some View {
        NavigationView {
            ProgramDetailEditView(programs: $programs)
//            ProgramDetailEditView(programs: $programs, programToEdit: Program.sampleData()[0])
        }
    }
}
