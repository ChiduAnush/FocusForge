


// GameInfo.swift

import SwiftUI

struct GameInfo: View {
    
    var dialogue = [
        "Welcome to Maya's meditation session.",
        "As she tries to focus, her mind keeps wavering to numerous thoughts & distractions.",
        "'Oh! theres a notification on my phone!'\n'what should i have for dinner? 🤔'\n'maybe i should not have argued with my roommate..'\netc. ",
        "As she's just starting out, so there are too many random thoughts running on her mind.",
        "Let's help her, by pulling her mind back to focus everytime she gets distracted.",
        "Drag the blue circle to the blue dot(on her hands) everytime it wavers around.",
        "All the best!"
    ]
    
    @State var dIndex = -6
    @State var showClue: Bool = true
    @Binding var gameEnded: Bool
    @State private var showSecondEndText = false
    @State private var showFinalEndText = false
    
    var action: () -> Void
    
    var body: some View {
        ZStack {
            
            
            
            Color.clear
            
            VStack {
                
                HStack{
                    
                    
                    
                    if !gameEnded{
                        Text("Tap to continue")
                            .foregroundColor(.black)
                            .font(.title)
                            .opacity(showClue ? 0.8 : 0.1)
                            .padding(.top, 70)
                            .padding(.leading, 100)
                    }else{
                        if showFinalEndText{
                            
                            VStack{
                                Typewriter(text: "Keep practising Aum and remember to relax :)", time: 1, align: .leading)
                                    .foregroundColor(Color(red: 12 / 255, green: 101 / 255, blue: 130 / 255))
                                    .font(.title)
                                    .multilineTextAlignment(.leading)

                                Typewriter(text: "Thank you for staying around till the end.\n🍀")
                                    .foregroundColor(Color(red: 12 / 255, green: 101 / 255, blue: 130 / 255))
                                    .font(.title3)
                                    .multilineTextAlignment(.leading)
                                
                                Button(action: action) {
                                    Text("Some tips")
                                        .fontWeight(.semibold)
                                        .padding()
                                        .background(Color(red: 12 / 255, green: 101 / 255, blue: 130 / 255))
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                    
                                    
                                }
                            }
                            .frame(minWidth: 900, idealWidth: 1500, maxWidth: 1600, alignment: .leading)
                            .padding(.leading, 100)
                            .padding(.top, 70)
                            
                            
                        }
                    }
                    
                    
                    Spacer()    
                }
                Spacer()
            }
            
            VStack(spacing: 30) {
                ForEach(max(dIndex, 0)..<min(dialogue.count, dIndex + 6), id: \.self) { i in
                    HStack {
                        Typewriter(text: dialogue[i], time: 0.5, align: .leading)
                            .foregroundColor(Color(red: 67 / 255, green: 146 / 255, blue: 124 / 255))
                            .font(.title2)
                            .multilineTextAlignment(.leading)
                            .frame(minWidth: 100, idealWidth: 300, maxWidth: 400, alignment: .leading)
                    }
                    .frame(minWidth: 900, idealWidth: 1500, maxWidth: 1600, alignment: .leading)
                }
                
                
                if gameEnded {
                    
                    
                    
                    VStack{
                        Typewriter(text: "See? getting distracted is not the problem. The challange, is to realise and get your mind back to focus.", time: 1.5, align: .leading)
                            .foregroundColor(Color(red: 12 / 255, green: 101 / 255, blue: 130 / 255))
                            .font(.title)
                            .multilineTextAlignment(.leading)
                            .frame(minWidth: 100, idealWidth: 300, maxWidth: 400, alignment: .leading)
                            .onAppear{  
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    showSecondEndText = true
                                }
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                    showFinalEndText = true
                                }
                                
                                
                            }
                        
                        
                        
                        Typewriter(text: "Like any other skill, you will get better at this, with practise :)", time: 0.8, align: .leading)
                            .foregroundColor(Color(red: 12 / 255, green: 101 / 255, blue: 130 / 255))
                            .font(.title)
                            .multilineTextAlignment(.leading)
                            .frame(minWidth: 100, idealWidth: 300, maxWidth: 400, alignment: .leading)
//                            .padding(.top, 20)
                            .opacity(showSecondEndText ? 1 : 0)
                            .animation(.easeInOut(duration: 0.5))
                        
   
                        
                    }
                    .frame(minWidth: 900, idealWidth: 1500, maxWidth: 1600, alignment: .leading)
                    
                    
                    
                }
                
            }
            .frame(minWidth: 900, idealWidth: 1500, maxWidth: 1600)
            .padding([.leading, .trailing], 5)
            .offset(y: 200)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            if (dIndex + 5 < dialogue.count) {
                dIndex += 1
            }
            showClue = false
        }
        

    }
}
