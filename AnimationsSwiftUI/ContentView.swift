//
//  ContentView.swift
//  AnimationsSwiftUI
//
//  Created by Aleksandr Kretov on 29.05.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var toggleAnimation = [false, false, false, false]
    @State private var isSelfDissmissed = false

    private let bounds = UIScreen.main.bounds

    let animation1 = Animation.spring().speed(2)
    var body: some View {
        VStack(spacing: 24) {
            ZStack {
                RoundedRectangle(cornerRadius: 48)
                    .foregroundColor(.red)
                    .frame(width: 250, height: 250)
                    .shadow(color: .gray, radius: 3, x: 5, y: 5)
                    .scaleEffect(toggleAnimation[0] ? 1 : 3)
                    .opacity(toggleAnimation[0] ? 1 : 0)
                SwiftView()
                    .foregroundColor(.white)
                    .frame(width: 200, height: 200)
                    .opacity(toggleAnimation[1] ? 1 : 0)
                    .scaleEffect(toggleAnimation[1] ? 1 : 5)
            }
            .onTapGesture {
                isSelfDissmissed.toggle()
            }.fullScreenCover(isPresented: $isSelfDissmissed, content: {
                StartView()
            })
            HStack {
                Text("Welcome to")
                    .font(.title).bold()
                    .offset(x: toggleAnimation[2] ? 0 : -bounds.midX)
                    .opacity(toggleAnimation[2] ? 1 : 0)
                ShimmeringText(textColor: .red, shimColor: .white.opacity(0.7), text: "SwiftUI 3")
                    .font(.title.bold())
                    .opacity(toggleAnimation[3] ? 1 : 0)
            }
            Spacer()
            Text("Tap on Swift to go back...")
                .foregroundColor(.gray)
                .opacity(toggleAnimation[3] ? 0.7 : 0)
        }
        .padding()
        .onAppear {
            withAnimation(Animation.spring(response: 0.5, dampingFraction: 0.7).delay(0.5)) {
                toggleAnimation[0].toggle()

                withAnimation(Animation.spring(response: 0.9, dampingFraction: 0.6).delay(1)) {
                    toggleAnimation[1] = true
                }

                withAnimation(.easeInOut(duration: 0.5).delay(1.5)) {
                    toggleAnimation[2] = true
                }

                withAnimation(.easeInOut(duration: 1).delay(2)) {
                    toggleAnimation[3] = true
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
