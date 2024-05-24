import SwiftUI

struct ProgramListView: View {
    @Binding var programs: [Program]
    @State private var isPresentingNewProgramView = false
    @State private var programToEdit: Program?

    var body: some View {
        NavigationStack {
            listView
                .navigationTitle("Skating Music")
                .toolbar { addButton }
        }
        .sheet(isPresented: $isPresentingNewProgramView) {
            NavigationView {
                ProgramDetailEditView(programs: $programs, programToEdit: programToEdit)
            }
        }
    }

    @ViewBuilder
    var listView: some View {
        if programs.isEmpty {
            VStack {
                Text("No programs yet. Create your first one!").padding(10)
                Spacer()
            }
        } else {
            programListView
        }
    }

    var programListView: some View {
        List($programs) { $p in
            NavigationLink(destination: ProgramDetailView(program: $p)) {
                CardView(program: p)
            }
        }
    }

    var addButton: some View {
        Button(action: {
            programToEdit = nil
            isPresentingNewProgramView = true
        }) {
            Image(systemName: "plus")
        }
        .accessibilityLabel("New program music")
    }
}

struct ProgramListView_Previews: PreviewProvider {
    static var previews: some View {
        ProgramListView(programs: .constant(Program.sampleData()))
    }
}
