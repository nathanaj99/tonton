//
//  Swipe.swift
//  Tonton
//
//  Created by Nathanael Jo on 12/1/20.
//

import SwiftUI

struct Swipe: View {
    var body: some View {
        VStack {
            HStack {
                
                //T
                    Text("T").font(.custom("PermanentMarker-Regular", size: 50)).foregroundColor(Color(#colorLiteral(red: 0.45, green: 0.36, blue: 0.65, alpha: 0.94))).tracking(5)
                
                Spacer()

            //5:30
                Text("5: 30").font(.custom("Baloo2-Bold", size: 40)).foregroundColor(Color(#colorLiteral(red: 0.32, green: 0.32, blue: 0.32, alpha: 1))).tracking(8)
                
                Spacer()
                
                
                //Ellipse 6
                    Circle()
                    .fill(Color(#colorLiteral(red: 0.762499988079071, green: 0.2795833349227905, blue: 0.2795833349227905, alpha: 1)))
                    .frame(width: 13, height: 13)
            }.padding()
         
            
            ZStack(alignment: .bottom, content: {
                
                //movie poster
                    Image("ironman")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 336, height: 601)
                    .clipShape(RoundedRectangle(cornerRadius: 32))
                    .frame(width: 336, height: 601)
                
            //Rectangle
                RoundedRectangle(cornerRadius: 33)
                .fill(LinearGradient(
                gradient: Gradient(stops: [
                .init(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), location: 0),
                .init(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.0572916679084301)), location: 0.9998999834060669),
                .init(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)), location: 1)]),
                startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),
                endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999)))
                .frame(width: 336, height: 389)
                .rotationEffect(.degrees(-180))
                
                VStack {
                    Text("Iron Man (2008)").font(.custom("Baloo2-Bold", size: 40)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    
                }
                
            })
            
            ZStack {
            //Rectangle 4
                RoundedRectangle(cornerRadius: 24)
                .fill(Color(#colorLiteral(red: 0.699999988079071, green: 0.2070833444595337, blue: 0.21422718465328217, alpha: 1)))
                .frame(width: 121, height: 43)
                
                //Finish
                    Text("Finish").font(.custom("Baloo2-Bold", size: 20)).foregroundColor(Color(#colorLiteral(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)))
            }
        }
    }
}

struct Swipe_Previews: PreviewProvider {
    static var previews: some View {
        Swipe()
    }
}
