//
//  GradientBackground.swift
//  Tonton
//
//  Created by Nathanael Jo on 12/1/20.
//

import SwiftUI

struct GradientBackground: View {
    @State private var colorChange = true
    let grad = Gradient(stops: [.init(color: Color("Teal"), location: 0), .init(color: Color("Buff"), location: 0.5), .init(color: Color("Blood"), location: 1)
    ])
    
    @State var start1 = UnitPoint(x: 0, y: 0)
    @State var end1 = UnitPoint(x: -1, y: -1)
    @State var start2 = UnitPoint(x: 4, y: 4)
    @State var end2 = UnitPoint(x: 0, y: 0)
    
    let timer = Timer.publish(every: 15, on: .main, in: .default).autoconnect()
    var body: some View {
        LinearGradient(gradient: self.grad,
                       startPoint: colorChange ? self.start1 : self.start2,
                       endPoint: colorChange ? self.end1 : self.end2).onReceive(timer) { time in
    withAnimation(.easeInOut(duration: 15)) {
        self.colorChange.toggle()
    }
    
}
        
    }
}

struct GradientBackground_Previews: PreviewProvider {
    static var previews: some View {
        GradientBackground()
    }
}
