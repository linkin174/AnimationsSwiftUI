//
//  SwiftView.swift
//  AnimationsSwiftUI
//
//  Created by Aleksandr Kretov on 30.05.2022.
//

import SwiftUI

struct SwiftView: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let startPoint = CGPoint(x: rect.maxX * 0.97, y: rect.maxY * 0.93)
        path.move(to: startPoint)
        // beak
        path.addQuadCurve(to: CGPoint(x: rect.maxX * 0.9, y: rect.maxY * 0.68),
                          control: CGPoint(x: rect.maxX, y: rect.maxY * 0.8))
        // top wing
        path.addQuadCurve(to: CGPoint(x: rect.maxX * 0.61, y: rect.maxY * 0.07),
                          control: CGPoint(x: rect.maxX * 0.97, y: rect.maxY * 0.33))
        path.addQuadCurve(to: CGPoint(x: rect.maxX * 0.7, y: rect.maxY * 0.53),
                          control: CGPoint(x: rect.maxX * 0.76, y: rect.maxY * 0.32))
        // top end
        path.addQuadCurve(to: CGPoint(x: rect.maxX * 0.235, y: rect.maxY * 0.15),
                          control: CGPoint(x: rect.maxX * 0.6, y: rect.maxY * 0.48))
        path.addQuadCurve(to: CGPoint(x: rect.maxX * 0.49, y: rect.maxY * 0.48),
                          control: CGPoint(x: rect.maxX * 0.4, y: rect.maxY * 0.4))
        // bottom end
        path.addQuadCurve(to: CGPoint(x: rect.maxX * 0.12, y: rect.maxY * 0.2),
                          control: CGPoint(x: rect.maxX * 0.16, y: rect.maxY * 0.26))
        path.addQuadCurve(to: CGPoint(x: rect.maxX * 0.57, y: rect.maxY * 0.69),
                          control: CGPoint(x: rect.maxX * 0.23, y: rect.maxY * 0.39))
        // bottom wing
        path.addQuadCurve(to: CGPoint(x: rect.maxX * 0.025, y: rect.maxY * 0.625),
                          control: CGPoint(x: rect.maxX * 0.35, y: rect.maxY * 0.82))
        path.addCurve(to: startPoint,
                      control1: CGPoint(x: rect.maxX * 0.63, y: rect.maxY * 1.28),
                      control2: CGPoint(x: rect.maxX * 0.76, y: rect.maxY * 0.61))
        return path
    }
}

struct SwiftView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftView()
//            .background(Image("swift").resizable())
            .frame(width: 200, height: 200)
    }
}
