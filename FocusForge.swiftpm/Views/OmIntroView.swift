import SwiftUI


struct OmIntroView: View {
    
    @Binding var isPresented: Bool 
    
    var body: some View {
        ZStack {
            
            Color(uiColor: .black)
                .ignoresSafeArea()
            
            Image("greenyBG")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .opacity(0.3)
                .ignoresSafeArea()
            
            ScrollView{
                
                VStack(spacing: 30) {
                    
                    Image("OmSymbol")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150)
                    
                    Text("Om: The Sound of Focus")
                        .font(.largeTitle)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .padding(.top, 40)
                    
                    Text("Om, also spelled Aum, is a sacred sound and a spiritual icon in Indian religions. Chanting Om is believed to have numerous benefits, including enhancing focus, calming the mind, and promoting inner peace.")
                        .foregroundColor(.white)
                        .padding()
                        .multilineTextAlignment(.center)
                        .frame(width: 500)
                    
                    VStack(alignment: .center, spacing: 10) {
                        Text("Benefits of Chanting Om")
                            .font(.title)
                            .fontWeight(.regular)
                            .foregroundColor(.white)
                        
                        ForEach(0..<OmBenefits.benefits.count, id: \.self) { index in
                            Text("\(index + 1). \(OmBenefits.benefits[index])")
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                        }
                    }
                    .padding()
                    

                    VStack(alignment: .center, spacing: 10) {
                        Text("Tips for Chanting Om")
                            .font(.title)
                            .fontWeight(.regular)
                            .foregroundColor(.white)
                        
                        ForEach(0..<OmTips.tips.count, id: \.self) { index in
                            Text("\(index + 1). \(OmTips.tips[index])")
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                        }
                    }
                    .padding()
                    
                }
                .padding(50)
                
                
                Button(action: {
                    // go back to ChantOmView.
                    isPresented.toggle()
                }) {
                    Text("Go back")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black)
                        .opacity(0.4)
                        .cornerRadius(10)
                }
                .padding(.top, 20)
                
            }
            
            
           
            





        }
    }
}

//struct OmIntroView_Previews: PreviewProvider {
//    static var previews: some View {
//        OmIntroView(isPresented: true)
//    }
//}

struct OmBenefits {
    static let benefits = [
        "Enhances focus and concentration",
        "Calms the mind and reduces stress",
        "Promotes inner peace and emotional balance",
        "Increases self-awareness and mindfulness",
        "Aids in relaxation and better sleep"
    ]
}


struct OmTips {
    static let tips = [
        "Find a quiet and comfortable space for chanting",
        "Sit in a relaxed posture with your spine straight",
        "Take deep breaths before and after chanting Om",
        "Chant A-u-m slowly and steadily, focusing on the vibration",
        "Open your mouth and say 'Aa', then gently close your mouth, it becomes 'Ou',\nthen fully close your mouth, it becomes 'Mm'."
    ]
}
