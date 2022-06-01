//
//  ShimmeringText.swift
//  AnimationsSwiftUI
//
//  Created by Aleksandr Kretov on 31.05.2022.
//

import SwiftUI

struct ShimmeringText: View {
    @State private var isAnimating = false
    private let bounds = UIScreen.main.bounds
    let textColor: Color
    let shimColor: Color
    let text: String
    var body: some View {
        ZStack {
            Text(text)
                .foregroundColor(textColor)

            Text(text)
                .foregroundColor(shimColor)
                .mask {
                    Rectangle()
                        .rotationEffect(.degrees(-45))
                        .frame(width: 40, height: 100)
                        .offset(x: -bounds.midX)
                        .offset(x: isAnimating ? bounds.maxX * 2 : 0)
                }
                .blendMode(.difference)
        }
        .onAppear {
            withAnimation(Animation.linear(duration: 2.5)
                .repeatForever(autoreverses: false)) {
                    isAnimating.toggle()
                }
        }
    }
}

struct ShimmeringText_Previews: PreviewProvider {
    static var previews: some View {
        ShimmeringText(textColor: .gray, shimColor: .white, text: "GO FORWARD!")
    }
}
