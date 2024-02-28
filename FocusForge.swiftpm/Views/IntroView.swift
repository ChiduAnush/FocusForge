import SwiftUI

struct IntroView: View {
    
    @State private var isOmInfoViewPresented = false
    var action: () -> Void
    
    
    var body: some View{
        
        ZStack{

            Color(.black)
                .ignoresSafeArea()
            
            VStack(spacing: 30){
                VStack{
                    Text("Please play this experience in fullscreen on a mac, *dark mode*.")
                        .foregroundColor(Color(red: 67 / 255, green: 146 / 255, blue: 124 / 255))
                        .font(.title2)
                        .italic()
                        .padding(.vertical, 50)
                }
                
                Text("In the ebb and flow of life, we all encounter moments of stress, distraction, and a loss of inner harmony.")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                
                Image("grrrTransperent")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 400)
                
                
                Text("The noise of the world often drowns out our inner voice, leaving us feeling disconnected and scattered.")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                
                Text("Our minds wander, and our attention becomes fragmented, hindering our ability to focus.")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                
                Text("This is where the ancient practice of Om chanting, or more correctly, 'Aum' chanting, offers a profound solution.")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                
                
                Button(action: {
                    isOmInfoViewPresented.toggle()
                }) {
                    Text("Learn more about Aum")
                        .fontWeight(.semibold)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button(action: action){
                    Text("Continue")
                        .fontWeight(.semibold)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
            }
            
            
        }
        .fullScreenCover(isPresented: $isOmInfoViewPresented) {
            OmInfo1(dismissAction: {
                isOmInfoViewPresented = false
            })
        }
        
        
        
        
    }
}

//
//struct Introview_previews: PreviewProvider {
//    static var previews: some View{
//        IntroView()
//    }
//}

