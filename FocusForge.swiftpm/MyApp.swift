import SwiftUI

@main
struct MyApp: App {
    
    @Environment(\.scenePhase) private var scenePhase
    
    @StateObject var microphoneManager = MicrophoneManager.shared
    
    var body: some Scene {
        WindowGroup {

            ContentView()

        }
        .onChange(of: scenePhase) {phase in
            if phase == .active {
                Task(priority: .userInitiated) {
                    microphoneManager.startRunning()
                }
            }
        }
        
        
    }
}
