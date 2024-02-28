import SwiftUI
import AVKit
import Combine

struct OmInfo1: View {
    
    var dismissAction: () -> Void
    
    
    @State private var currentDialogueIndex = 0
    @State private var showVideo:Bool = false
    @State private var showOmPic:Bool = false
    
    @State private var isLastDialogue: Bool = false
    
    
    let dialogues = [
        "Hello, there. Welcome to Focus forge. I will be your guide, in this journey to inner peace.",
        "Lets delve into the profound depths of 'Aum', a sacred sound and a spiritual icon in Indian religions.",
        "The chanting of 'Aum' is not just a ritual, but a bridge that connects our inner self with the cosmic consciousness.",
        "When chanted correctly, 'Aum' produces a vibration that resonates with the universe, harmonizing our physical and mental states with the cosmic vibrations.",
        "The sound of 'Aum' is composed of three syllables: 'A', 'U', and 'M'. Each syllable represents a different state of consciousness, and the entire sound encompasses the universe and all its facets.",
        "The vibrations produced by chanting 'Aum' can have a healing effect on the body, promoting overall well-being and balance.\n\nCause of this, Aum is often chanted at the beginning and end of yoga sessions or meditation practices.",
        "Now, let's learn how to write the symbol 'Om'.",
        "The 'Om' symbol is composed of three curves, one semicircle, and a dot.\n\nThe large bottom curve(1) symbolizes the waking state, 'A'. \nThe middle curve(2) signifies the dream state, 'U'. \nThe upper curve(3) denotes the state of deep sleep, 'M'. \nThe semicircle(4) represents Maya, or illusion, and The dot(5) signifies the purestate of consciousness, Turiya, the silence after Aum.",
        "Great! lets now start chanting."
    ]
    
    
    var body: some View {
        ZStack {
            Color(red: 132 / 255, green: 229 / 255, blue: 255 / 255)
            
            VStack {
                
                Spacer()
                
                HStack{
                    Spacer()
                    Spacer()
                    
                    TextBubbleView(dialogues: dialogues, currentDialogueIndex: $currentDialogueIndex, characterName: "Guruji", isLastDialogue: $isLastDialogue, dismissAction: dismissAction) { 
                        
                        
                        if currentDialogueIndex < dialogues.count - 1 {
                            currentDialogueIndex += 1
                            
                            if dialogues[currentDialogueIndex] == "Now, let's learn how to write the symbol 'Om'." {
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                    showVideo = true
                                }
                            }
                            
                            if dialogues[currentDialogueIndex] == "The 'Om' symbol is composed of three curves, one semicircle, and a dot.\n\nThe large bottom curve(1) symbolizes the waking state, 'A'. \nThe middle curve(2) signifies the dream state, 'U'. \nThe upper curve(3) denotes the state of deep sleep, 'M'. \nThe semicircle(4) represents Maya, or illusion, and The dot(5) signifies the purestate of consciousness, Turiya, the silence after Aum." {
                                
                                showOmPic = true
                            }
                            
                        } else if currentDialogueIndex == dialogues.count - 1 {
                            isLastDialogue = true
                        }
                        
                    }
                    .padding()
                    .padding(.horizontal, 50)
                    
                    
                    Spacer()
                }
                .zIndex(0)
                
                
                
                Spacer()
                
                HStack{
                    Image("tutor") 
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 700)
                        .offset(y: 30)
                    Spacer()
                    
                    Image("OmPic")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 500)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .opacity(showOmPic ? 1 : 0)
                        .animation(.easeInOut(duration: 0.9))
                        .offset(y: 30)
                        .padding(.trailing, 100)
                    
                }
                .frame(width: .infinity)
                
                .zIndex(2)
                
                
                Spacer()
            }
            
            .padding(.horizontal)
            .sheet(isPresented: $showVideo) {
                VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "DrawOm", withExtension: "mov")!)) {
                    VStack {
                        Text("Om Writing Tutorial")
                            .font(.title3)
                            .padding(.top, -50)
                        Spacer()
                    }
                }
            }
            
        }
        .id(currentDialogueIndex) 
    }
}





struct TypingText: View {
    let dialogues: [String]
    @Binding var currentDialogueIndex: Int
    
    @State private var displayedText = ""
    @State private var counter = 0
    @State private var timer: Timer? = nil
    
    var body: some View {
        Text(displayedText)
            .multilineTextAlignment(.leading)
            .onAppear {
                updateText()
                timer = Timer.scheduledTimer(withTimeInterval: 0.025, repeats: true) { _ in
                    updateText()
                }
            }
            .onDisappear {
                timer?.invalidate()
            }
    }
    
    private func updateText() {
        guard counter < dialogues[currentDialogueIndex].count else {
            timer?.invalidate()
            return
        }
        displayedText.append(dialogues[currentDialogueIndex][dialogues[currentDialogueIndex].index(dialogues[currentDialogueIndex].startIndex, offsetBy: counter)])
        counter += 1
    }
}







struct TextBubbleView: View {
    let dialogues: [String]
    @Binding var currentDialogueIndex: Int
    
    var characterName: String
    
    @Binding var isLastDialogue: Bool
    
    var dismissAction: () -> Void
    
    var onTap: () -> Void
    
    
    
    
    var body: some View {
        ZStack {
            BubbleShape().fill(Color.white)
            BubbleShape().stroke(Color.cyan, lineWidth: 10)
            VStack(alignment: .leading) {
                
                Spacer()

//                TypingText()
//                Text(text)
                TypingText(dialogues: dialogues, currentDialogueIndex: $currentDialogueIndex)
                    .font(.title)
                    .padding(10)
                    .padding(.horizontal, 100)
                    .foregroundColor(Color.black)
                
                //                Text(text)
                //                    .font(.title2)
                //                    .padding(10)
                //                    .padding(.horizontal, 100)
                //                    .foregroundColor(Color.black)
                
                
                Spacer()
            }
            .frame(width: .infinity)
            .padding(20)
            
            VStack{
                HStack{
                    Text(characterName)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 20)
                        .background(Color.cyan)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    
                    Spacer()
                    
                }
                
                Spacer()
            }
            
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Circle()
                        .fill(Color.white)
                        .frame(width: 100, height: 100)
                        .overlay(
                            Image(systemName: isLastDialogue ? "arrowshape.right.fill" : "chevron.right")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.cyan)
                                .frame(width: 30, height: 30)
                                .fontWeight(.semibold)
                        )
                        .overlay(
                            Circle().stroke(Color.cyan, lineWidth: 10)
                        )
                        .offset(x: 10, y: 20)
                        .onTapGesture {
                            
                            if isLastDialogue {
                                dismissAction()
                            }else {
                                onTap()
                            }
                            
                            
                        }
                    
                }
            }
            
            
            
            
        }
    }
}




struct BubbleShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = RoundedRectangle(cornerRadius: 25, style: .continuous)
        return path.path(in: rect)
    }
}
