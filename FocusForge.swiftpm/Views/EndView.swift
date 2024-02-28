import SwiftUI


struct EndView: View {
    var body: some View{
        
        ZStack{
            
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 20){
                Image("peaceMind")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350)
                
                Typewriter(text: "It's okay to get distracted.", time: 0.8, align: .center)
                    .foregroundColor(.white)
                
                Typewriter(text: "Focus is a skill which can be learned with practise.", time: 1.0, align: .center)
                    .foregroundColor(.white)
                
                Typewriter(text: "The secret ingredient, is to realise that you are getting distracted, and to take the necessary actions to correct it.", time: 1.2, align: .center)
                    .foregroundColor(.white)
                
                Typewriter(text: "The more you train your mind to obey your command, the better you will be at focussing. ", time: 1.3, align: .center)
                    .foregroundColor(.white)
                
                
                Typewriter(text: "Chanting Aum, and meditating, will help you with that :)", time: 1.5, align: .center)
                    .foregroundColor(.white)
                    .foregroundColor(Color(red: 67 / 255, green: 146 / 255, blue: 124 / 255))
                    .italic()
                    .padding(.vertical, 50)
                
                Typewriter(text: "Thank you", time: 1.5, align: .center)
                    .foregroundColor(.white)
                    .foregroundColor(Color(red: 67 / 255, green: 146 / 255, blue: 124 / 255))
                    .italic()
                    .padding(.vertical, 50)
                
                
            }
            
            
            
            
        }
    }
}
