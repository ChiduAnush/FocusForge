


import SwiftUI

struct ParentGameView: View {
    @State private var gameEnded = false
    
    var action: () -> Void
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                Color(red: 67 / 255, green: 146 / 255, blue: 124 / 255)
                
                Image("mayaMeditate")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                GameInfo(gameEnded: $gameEnded, action: action)
                
                MindFocusGameView(gameEnded: $gameEnded)
                    .frame(width: geometry.size.width / 2, height: geometry.size.height)
                    .padding(.leading, 165)
                    .padding(.top, 40)
            }
        }
    }
}
