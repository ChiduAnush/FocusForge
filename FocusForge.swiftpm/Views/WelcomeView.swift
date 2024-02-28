import SwiftUI


struct WelcomeView: View {
    
    var action: () -> Void
    
    var body: some View {
        
        ZStack{

            
            Color(uiColor: .black)
                .ignoresSafeArea()
            
            
            Image("koiPond")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .opacity(0.15)
                .ignoresSafeArea()
            
            
            VStack {
                Text("Welcome to FocusForge")
                    .font(.title)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .foregroundColor(.white)
                Text("your guide to a peacuful mind.")
                    .font(.title3)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.top, 2)
                    .foregroundColor(.white)
                
                
                
                Button(action: action) {
                    Text("Continue")
                        .fontWeight(.semibold)
                        .padding()
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.vertical)
                        .padding(.vertical)
                    
                    
                }
                
                
            }
            .padding()
            
            VStack {
                Spacer()
                Text("WWDC24 Swift Student Challange Submission")
                    .foregroundColor(.white)
            }
            .padding(.bottom, 25)
            
            
            
            
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView{}
    }
}
