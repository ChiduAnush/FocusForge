

// MindFocusGameView.swift

import SwiftUI

struct MindFocusGameView: View {
    @State private var focusPosition = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
    @State private var mayaEmotion: String = "😌"
    @State private var showMayaText = false
    @State private var successfulDrags = 0
    @Binding var gameEnded:Bool
    
    let distractions = ["omg i have so much\nwork left to do.", "notification!\nwhatsapp?", "oh! sounds like my\nroommate is back", "man, i need to study\nfor the test."]
    @State private var distractionCoordinates: [CGPoint] = []
    
    var body: some View {
        VStack {
            Spacer()
            
            ZStack {
                Text(".")
                    .font(.system(size: 75))
                    .foregroundColor(.blue)
                    .position(CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.75))
                
                ForEach(0..<distractions.count, id: \.self) { index in
                    if index < distractionCoordinates.count {
                        Text(distractions[index])
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                            .position(distractionCoordinates[index])
                    }
                }
                
                Circle()
                    .stroke(Color.blue, lineWidth: 10)
                    .frame(width: 100, height: 100)
                    .position(focusPosition)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                focusPosition = value.location
                                checkIfFocusOnDistraction()
                            }
                            .onEnded { _ in
                                checkIfFocusOnMaya()
                            }
                    )
            }
            .onAppear {
                focusOnRandomDistraction()
            }
            
            Spacer()
            
            if showMayaText {
                Text("Maya is happy!")
                    .font(.title)
                    .padding()
            }
        }
        .onAppear {
            distractionCoordinates = calculateDistractionPositions()
        }
    }
    
    func calculateDistractionPositions() -> [CGPoint] {
        let angleStep = CGFloat.pi / 1 / CGFloat(distractions.count - 1)
        let radius = UIScreen.main.bounds.width * 0.30
        
        var distractionCoordinates: [CGPoint] = []
        
        for i in 0..<distractions.count {
            let x = UIScreen.main.bounds.width / 2 + radius * cos(angleStep * CGFloat(i))
            let y = UIScreen.main.bounds.height * 0.75 - radius * sin(angleStep * CGFloat(i))
            distractionCoordinates.append(CGPoint(x: x, y: y - 200))
        }
        
        return distractionCoordinates
    }
    
    func focusOnRandomDistraction() {
        guard !gameEnded else {
            return
        }
        
        let randomIndex = Int.random(in: 0..<distractionCoordinates.count)
        let randomDistractionPosition = distractionCoordinates[randomIndex]
        withAnimation(.easeInOut(duration: 2)) {
            focusPosition = randomDistractionPosition
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            if !gameEnded {
                focusOnRandomDistraction()
            }
        }
    }
    
    func checkIfFocusOnMaya() {
        if distanceBetweenPoints(point1: focusPosition, point2: CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height * 0.75)) < 50 {
            mayaEmotion = "😌"
            successfulDrags += 1
            if successfulDrags >= 5 {
                showMayaText = true
                gameEnded = true
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    focusOnRandomDistraction()
                }
            }
        } else {
            mayaEmotion = "😨"
        }
    }
    
    func checkIfFocusOnDistraction() {
        if distractionCoordinates.contains(where: { distanceBetweenPoints(point1: focusPosition, point2: $0) < 50 }) {
            mayaEmotion = "😨"
        } else {
            mayaEmotion = "😌"
        }
    }
    
    func distanceBetweenPoints(point1: CGPoint, point2: CGPoint) -> CGFloat {
        return sqrt(pow(point2.x - point1.x, 2) + pow(point2.y - point1.y, 2))
    }
}
