import SwiftUI

struct ChantOmView: View {
    @EnvironmentObject var microphoneManager: MicrophoneManager
    
    @State private var chantingCount: Int = 0
    @State private var chantingDuration: TimeInterval = 0
    @State private var showCongratulationsMessage = false
    @State private var showButton = false
    @State private var timer: Timer?
    
    @State private var showConfirmation:Bool = false
    
    @State private var isOmIntroViewPresented = false
    
    var action: () -> Void
    
    @State private var moveUp = false
    
    var body: some View {
        ZStack {
            Color(uiColor: .black)
                .ignoresSafeArea()
            
            
            VStack {
                Text("Chant Aum as practised before.")
                    .font(.title2)
                    .foregroundColor(.white)
                    .offset(y: moveUp ? -400 : 0)
                    .animation(.easeInOut(duration: 0.5))
                
                Text("At least 3 long duration chants to continue.")
                    .font(.title2)
                    .foregroundColor(.white)
                    .offset(y: moveUp ? -400 : 0)
                    .animation(.easeInOut(duration: 0.5))
                
                Text("You can click the top right button to learn more about Aum.")
                    .font(.title3)
                    .foregroundColor(.white)
                    .offset(y: moveUp ? -400 : 0)
                    .animation(.easeInOut(duration: 0.5))
                
                Text("Chanting detected.")
                    .font(.title3)
                    .foregroundColor(Color(red: 67 / 255, green: 146 / 255, blue: 124 / 255))
                    .offset(y: moveUp ? -370 : 0)
                    .opacity(showConfirmation ? 1 : 0)
                    .animation(.easeInOut(duration: 0.2))
                
                
                Text("Tip: wear earphones and keep the mic close to you.")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.bottom, 25)
                    .offset(y: moveUp ? 500 : 0)
                    .animation(.easeInOut(duration: 0.5))
                
                
            }
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
                    withAnimation {
                        self.moveUp = true
                    }
                }
            }
            
            
            Image("greenFlowerTransperent")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 250)
                .opacity(microphoneManager.chantingDetected ? 1.0 : 0.0) 
                .animation(.easeInOut(duration: 0.8))
                .ignoresSafeArea()
            
            VStack {
                Text("Congratulations!")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .opacity(showCongratulationsMessage ? 1.0 : 0.0)
                    .animation(.easeInOut(duration: 0.8))
                
                
                Text("Let's now help Maya focus.")
                    .font(.headline)
                    .fontWeight(.regular)
                    .foregroundColor(.white)
                    .opacity(showCongratulationsMessage ? 1.0 : 0.0)
                    .animation(.easeInOut(duration: 0.8))
                
                
                Button(action: action) {
                    Text("Next")
                        .fontWeight(.semibold)
                        .padding(.horizontal, 35)
                        .padding(.vertical, 10)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.green, lineWidth: 2)  
                                .shadow(color: Color.green.opacity(0.8), radius: 5, x: 5, y: 10)
                        )
                        .opacity(showButton ? 1.0 : 0.0)
                        .animation(.easeInOut(duration: 1.0))
                        .padding(.top, 20)
                    
                }
            }
            
            
            VStack{
                HStack{
                    Spacer()
                    Button(action: {
                        // to open the OmIntroView
                        isOmIntroViewPresented.toggle()
                    }) {
                        Image(systemName: "info.circle")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                    }
                    .padding(.top, 20) 
                    .padding(.trailing, 20) 
                    .fullScreenCover(isPresented: $isOmIntroViewPresented, content: {
                        OmIntroView(isPresented: $isOmIntroViewPresented) 
                    })
                    if isOmIntroViewPresented {
                        // close OmIntroView
                        Color.clear
                            .onTapGesture {
                                isOmIntroViewPresented.toggle()
                            }
                    }
                    
                }
                Spacer()
            }
            
            
            
        }
        .onAppear {
            startTimer()
        }
        .onDisappear {
            timer?.invalidate()
            timer = nil
        }
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if microphoneManager.chantingDetected {
                chantingDuration += 1
                showConfirmation = true
                if chantingDuration >= 3 {
                    chantingCount += 1
                    if chantingCount >= 11 {
                        showCongratulationsMessage = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            showButton = true
                        }
                        timer?.invalidate()
                        timer = nil
                    }
                }
                
            } else {
                chantingDuration = 0
                
                showConfirmation = false
                
            }
            
        }
    }
}


//struct ChantOmView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChantOmView{}
//    }
//}

