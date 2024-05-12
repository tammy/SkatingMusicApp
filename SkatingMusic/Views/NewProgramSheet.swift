import SwiftUI

struct NewProgramSheet: View {
    @State private var newProgram = Program.emptyProgram
    @Binding var programs: [Program]
    @Binding var isPresentingNewProgramView: Bool
    
    var body: some View {
        NavigationStack {
            ProgramDetailEditView(program: $newProgram)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewProgramView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            programs.append(newProgram)
                            isPresentingNewProgramView = false
                        }
                    }
                }
        }
    }
}

struct NewProgramSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewProgramSheet(programs: .constant(Program.sampleData), isPresentingNewProgramView: .constant(true))
    }
}
