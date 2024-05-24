import SwiftUI
import Combine

class ProgramStore: ObservableObject {
    @Published var programs: [Program] = []
    
    private var cancellables: Set<AnyCancellable> = []

    init() {
        loadPrograms()
    }

    func loadPrograms() {
        if let data = UserDefaults.standard.data(forKey: "programs") {
            if let decodedPrograms = try? JSONDecoder().decode([Program].self, from: data) {
                self.programs = decodedPrograms
            }
        }
    }

    func savePrograms() {
        if let encodedPrograms = try? JSONEncoder().encode(programs) {
            UserDefaults.standard.set(encodedPrograms, forKey: "programs")
        }
    }

    func addProgram(_ program: Program) {
        programs.append(program)
        savePrograms()
    }

    func updateProgram(_ program: Program) {
        if let index = programs.firstIndex(where: { $0.id == program.id }) {
            programs[index] = program
            savePrograms()
        }
    }
}
