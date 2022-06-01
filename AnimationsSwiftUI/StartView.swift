//
//  StartView.swift
//  AnimationsSwiftUI
//
//  Created by Aleksandr Kretov on 31.05.2022.
//

import SwiftUI

struct StartView: View {
    @State private var isAnimating = false
    @State private var isPressed = false
    let heartBeat = Animation
        .easeInOut(duration: 0.8)
        .repeatForever(autoreverses: true)

    private let bounds = UIScreen.main.bounds
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3).ignoresSafeArea()
            Button(action: { isPressed.toggle() }) {
                ShimmeringText(textColor: .white.opacity(0.8),
                               shimColor: .white,
                               text: "Let's Go!").font(.title.bold())
            }
            .padding(12)
            .background(.blue)
            .cornerRadius(24)
            .scaleEffect(isAnimating ? 1 : 0.95)
            .shadow(color: .black, radius: 5, x: 0, y: 0)
            .fullScreenCover(isPresented: $isPressed, content: {
                ContentView()
            })
            .onAppear {
                withAnimation(heartBeat) {
                    isAnimating.toggle()
                }
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
