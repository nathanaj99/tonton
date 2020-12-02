//
//  WaitRoom.swift
//  Tonton
//
//  Created by Nathanael Jo on 12/1/20.
//

import SwiftUI

struct WaitRoom: View {
    var body: some View {
        Color("Teal").ignoresSafeArea()
            .overlay(
        VStack {
            //Rectangle
            RoundedRectangle(cornerRadius: 40)
                .fill(Color(#colorLiteral(red: 0.5803921818733215, green: 0.6196078658103943, blue: 0.5529412031173706, alpha: 0.8999999761581421)))
            .frame(width: 328.1, height: 85)
                .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius:4, x:0, y:4).overlay(Text("AG97EY").font(.custom("Baloo2-Bold", size: 60)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(6))
            
            ZStack {

            //Rectangle
                RoundedRectangle(cornerRadius: 40)
                .fill(Color(#colorLiteral(red: 0.5803921818733215, green: 0.6196078658103943, blue: 0.5529412031173706, alpha: 0.8999999761581421)))
                .frame(width: 328.1, height: 85)
                .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius: 4, x: 0, y: 4)
            
            
            //AG97EY
                Text("AG97EY").font(.custom("Baloo2-Bold", size: 60)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(6)
            }
            
            //Waiting for host
            Text("Waiting for host").font(.custom("Baloo2-Bold", size: 28)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).multilineTextAlignment(.center)
            
            //to start session...
            Text("to start session...").font(.custom("Baloo2-Bold", size: 28)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).multilineTextAlignment(.center)
        })
    }
}

struct WaitRoom_Previews: PreviewProvider {
    static var previews: some View {
        WaitRoom()
    }
}
