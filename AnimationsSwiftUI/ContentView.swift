//
//  ContentView.swift
//  AnimationsSwiftUI
//
//  Created by Aleksandr Kretov on 29.05.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var textAnimating: (greet: Bool, swift: Bool) = (false, false)
    @State private var isSelfDissmissed = false
    @State private var rectParamteres: (opacity: Double, scale: Double) = (0, 5.0)
    @State private var birdParameters: (opacity: Double, scale: Double) = (0, 5.0)
    @State private var delay: Double = 0.5

    private let bounds = UIScreen.main.bounds

    let animation1 = Animation.spring().speed(2)
    var body: some View {
        VStack(spacing: 24) {
            ZStack {
                RoundedRectangle(cornerRadius: 48)
                    .foregroundColor(.red)
                    .frame(width: 250, height: 250)
                    .shadow(color: .gray, radius: 3, x: 5, y: 5)
                    .scaleEffect(rectParamteres.scale)
                    .opacity(rectParamteres.opacity)
                SwiftView()
                    .foregroundColor(.white)
                    .frame(width: 200, height: 200)
                    .opacity(birdParameters.opacity)
                    .scaleEffect(birdParameters.scale)
            }
            .onTapGesture {
                isSelfDissmissed.toggle()
            }.fullScreenCover(isPresented: $isSelfDissmissed, content: {
                StartView()
            })
            HStack {
                Text("Welcome to")
                    .font(.title).bold()
                    .offset(x: textAnimating.greet ? 0 : -bounds.midX)
                    .opacity(textAnimating.greet ? 1 : 0)
                ShimmeringText(textColor: .red, shimColor: .white.opacity(0.7), text: "SwiftUI 3")
                    .font(.title.bold())
                    .opacity(textAnimating.swift ? 1 : 0)
            }
            Spacer()
            Text("Tap on Swift to go back...")
                .foregroundColor(.gray)
                .opacity(textAnimating.swift ? 0.7 : 0)
        }
        .padding()
        .onAppear {
            withAnimation(Animation.spring(response: 0.5, dampingFraction: 0.7).delay(delay)) {
                rectParamteres.opacity = 1
                rectParamteres.scale = 1
                delay += 0.5
            }
            withAnimation(Animation.spring(response: 0.9, dampingFraction: 0.6).delay(delay)) {
                birdParameters.opacity = 1
                birdParameters.scale = 1
                delay += 0.5
            }

            withAnimation(.easeInOut(duration: 0.5).delay(delay)) {
                textAnimating.greet.toggle()
                delay += 0.5
            }

            withAnimation(.easeInOut(duration: 1).delay(delay)) {
                textAnimating.swift.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
