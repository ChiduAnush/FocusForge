
import SwiftUI
import AVKit
import Charts

struct IntroInstructionView: View {
    
    var action: () -> Void
    
    @EnvironmentObject var microphoneManager: MicrophoneManager
    
    @State private var edge: Edge = .bottom

    @State private var titlePrompts: [String] = [
        "Let's learn how to chant correctly.",
        "Make sure you are in a quiet room",
        "Sit upright, and try to concentrate on your breath.",
        "Deep breaths",
        "Inhale...  \nHold for 5 seconds",
        "Exhale.",
        "Now, your Aum sound something like this:",
        "see if your microphone is detecting your chant."
    ]
    @State private var currentPromptIndex: Int = 0
    @State private var titleText: String = "Let's learn how to chant correctly."
    @State private var titleOpacity: Double = 0
    @State private var continueButtonOpacity: Double = 0
    
    @State private var player = AVPlayer()
    
    var body: some View {
        
        ZStack{
            
            Color(.black)
                .ignoresSafeArea()
            
            
            VStack(spacing: 40) {
                Text(titleText)
                    .font(.system(.largeTitle, design: .default))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .opacity(1)
                
                if currentPromptIndex == 6 {
                    VideoPlayer(player: player)
                        .frame(width: 550)
                        .frame(height: 450)
                        .disabled(true)
                        .animation(.default)
                } else if currentPromptIndex == 7 {
                    VStack {
                        let chantingData = microphoneManager.chantingData.suffix(200)
                        
                        if chantingData.count == 200 {
                            Chart {
                                ForEach(chantingData, id: \.date) { item in
                                    LineMark(
                                        x: .value("Time", item.date),
                                        y: .value("Chanting Intensity", item.intensity)
                                    )
                                }
                            }
                            .chartYScale(domain: 0...400)
                            .frame(width: 500, height: 200)
                        } else {
                            ZStack {
                                Text("Chanting data loading...")
                                    .font(.system(size: 20, design: .default))
                                    .foregroundColor(.gray)
                            }
                            .frame(height: 300)
                        }
                        
                        Text("Tip: Get closer to the mic. The graph should detect your voice.")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, design: .rounded))
                            .padding(.top, 25)
                    }
                    .padding()
                }
                
                Button((currentPromptIndex == titlePrompts.count - 1) ? "Continue" : "Next") {
                    guard continueButtonOpacity != 0.3 else { return }
                    
                    withAnimation(.easeOut(duration: 0.1)) {
                        self.titleOpacity = 0
                        self.continueButtonOpacity = 0.3
                        self.currentPromptIndex += 1
                        titleText = " "
                    }
                }
                .buttonStyle(.bordered)
                .font(.system(.body, design: .default))
                .controlSize(.large)
                .tint(.green)
                .opacity(continueButtonOpacity)
                .animation(.default)
            }
            .onAppear {
                if player.currentItem == nil {
                    let item = AVPlayerItem(url:  Bundle.main.url(forResource: "OmChidu2", withExtension: "mov")!)
                    player.replaceCurrentItem(with: item)
                }
                edge = .top
                
                withAnimation(.easeIn(duration: 1)) {
                    self.continueButtonOpacity = 1
                }
            }
            .onChange(of: currentPromptIndex) { newValue in
                if titlePrompts.count == newValue {

                    action()
                    return
                }
                
                if currentPromptIndex == 6 {
                    player.play()
                }
                
                titleOpacity = 1
                

                
                withAnimation(.easeInOut(duration: 1.8)) {
                    titleText = titlePrompts[newValue]
                }
                

                DispatchQueue.main.asyncAfter(deadline: .now() + Double(titlePrompts[newValue].count) * 0.02) {

                    continueButtonOpacity = 1
                }
            }
            .transition(.move(edge: edge))
            .frame(maxWidth: .infinity)
            .frame(maxHeight: .infinity)
            
            
        }
        
    }
}
