//
//  DistractionView.swift
//  Fomcus
//
//  Created by Chidu Anush on 18/02/24.
//

import SwiftUI

struct BenefitsView: View {
    
    var action: () -> Void
    
    @State private var continueButtonOpacity: Double = 0
    
    @State private var edge: Edge = .trailing
    
    var body: some View {
        ZStack {
            
            Color(.black)
                .ignoresSafeArea()
            
            
            
            VStack(spacing: 40) {
                Text("All these benefits do not require more than\n3 mins everyday.")
                    .font(.system(.title))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Button(action: action) {
                    Text("Continue")
                        .fontWeight(.semibold)
                        .padding()
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .opacity(continueButtonOpacity)
                .animation(
                    Animation.easeOut(duration: 0.5)
                        .delay(5.5)
                )
            }
            .padding()
            
            Text("Improved mental clarity")
                .font(.system(size: 30, design: .rounded))
                .foregroundColor(.white)
                .opacity(continueButtonOpacity)
                .offset(x: -140, y: -240)
                .animation(
                    Animation.easeInOut(duration: 1)
                        .delay(0.5)
                )
            
            Text("Reduced anxiety")
                .font(.system(size: 30, design: .rounded))
                .foregroundColor(.white)
                .opacity(continueButtonOpacity)
                .offset(x: 130, y: -350)
                .animation(
                    Animation.easeInOut(duration: 1)
                        .delay(1.5)
                )
            
            Text("Enhanced mood")
                .font(.system(size: 30, design: .rounded))
                .foregroundColor(.white)
                .opacity(continueButtonOpacity)
                .offset(x: 170, y: 130)
                .animation(
                    Animation.easeInOut(duration: 1)
                        .delay(2.5)
                )
            
            Text("Better sleep quality")
                .font(.system(size: 30, design: .rounded))
                .foregroundColor(.white)
                .opacity(continueButtonOpacity)
                .offset(x: -150, y: 250)
                .animation(
                    Animation.easeInOut(duration: 1)
                        .delay(3.5)
                )
            
            Text("And many, many more")
                .font(.system(size: 30, design: .rounded))
                .foregroundColor(.white)
                .opacity(continueButtonOpacity)
                .offset(x: 170, y: 350)
                .animation(
                    Animation.easeInOut(duration: 1)
                        .delay(4.5)
                )
        }
        .transition(.move(edge: edge))
        .frame(maxWidth: .infinity)
        .frame(maxHeight: .infinity)
        .onAppear {
            withAnimation {
                continueButtonOpacity = 1
            }
        }
    }
}




#Preview {
    BenefitsView{}
}
