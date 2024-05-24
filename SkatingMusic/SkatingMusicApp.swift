import SwiftUI

@main
struct SkatingMusicApp: App {
    @StateObject private var store = ProgramStore()
    @State private var errorWrapper: ErrorWrapper?

    var body: some Scene {
        WindowGroup {
            ProgramListView(programs: $store.programs)
                .onAppear {
                    store.loadPrograms()
                }
                .sheet(item: $errorWrapper, onDismiss: {
                    store.programs = []
                }) { wrapper in
                    ErrorView(errorWrapper: wrapper)
                }
        }
    }
}
