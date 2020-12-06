//
//  NewSession.swift
//  Tonton
//
//  Created by Nathanael Jo on 12/1/20.
//

import SwiftUI

struct NewSession: View {
    var body: some View {
        GradientBackground().ignoresSafeArea()
            .overlay(
        VStack {
            Text("Your code is").font(.custom("Baloo2-SemiBold", size: 20)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
            
            //Rectangle
            RoundedRectangle(cornerRadius: 40)
                .fill(Color(#colorLiteral(red: 0.5803921818733215, green: 0.6196078658103943, blue: 0.5529412031173706, alpha: 0.8999999761581421)))
            .frame(width: 328.1, height: 85)
                .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius:4, x:0, y:4).overlay(//AG97EY
                    Text("AG97EY").font(.custom("Baloo2-Bold", size: 60)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(6))
            
            //3 people in session
            Text("3").font(.custom("Baloo2-SemiBold", size: 18)).foregroundColor(Color(#colorLiteral(red: 0.5, green: 0.53, blue: 0.48, alpha: 1))) + Text(" people in session ").font(.custom("Baloo2-SemiBold", size: 18)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
            
            //(including you!)
            Text("(including you!)").font(.custom("Baloo2-Bold", size: 16)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).multilineTextAlignment(.center)
            
            
            //Rectangle 4
            RoundedRectangle(cornerRadius: 24)
                .fill(Color(#colorLiteral(red: 0.32156863808631897, green: 0.34117648005485535, blue: 0.30588236451148987, alpha: 1)))
                .frame(width: 138, height: 48).overlay(//Start
                    Text("Start").font(.custom("Baloo2-SemiBold", size: 24)).foregroundColor(Color(#colorLiteral(red: 0.98, green: 0.98, blue: 0.98, alpha: 1))))
            
        })
    }
}

struct NewSession_Previews: PreviewProvider {
    static var previews: some View {
        NewSession()
    }
}
