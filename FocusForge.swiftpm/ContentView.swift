
import SwiftUI

struct ContentView: View {
    @StateObject var microphoneManager = MicrophoneManager.shared
    @State private var currentView: CurrentView = .welcomeView
    
    enum CurrentView {
        case welcomeView
        case introView
        case benefitsView
        case introInstructionView
        case chantOmView
        case parentGameView
        case EndView 
    }
    
    var body: some View {
        VStack {
            // Navigation logic
            switch currentView {
            case .welcomeView:
                WelcomeView {
                    withAnimation(.easeInOut(duration: 1)) {
                        currentView = .introView
                    }
                }
                
            case .introView:
                IntroView { 
                    withAnimation(.easeInOut(duration: 1)) {
                        currentView = .benefitsView
                    }
                }
                
            case .benefitsView:
                BenefitsView {
                    withAnimation(.easeInOut(duration: 1)) {
                        currentView = .introInstructionView
                    }
                }
                
            case .introInstructionView:
                IntroInstructionView {
                    withAnimation(.easeInOut(duration: 1)) {
                        currentView = .chantOmView
                    }
                }
                .environmentObject(microphoneManager)
                
            case .chantOmView:
                ChantOmView {
                    withAnimation(.easeInOut(duration: 1)) {
                        currentView = .parentGameView
                    }
                }
                .environmentObject(microphoneManager)
                
            case .parentGameView:
                ParentGameView {
                    withAnimation(.easeInOut(duration: 1)) {
                        currentView = .EndView
                    }
                }
                
            case .EndView:
                EndView()
            }
        }
    }
}
