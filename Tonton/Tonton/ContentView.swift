//
//  ContentView.swift
//  Tonton
//
//  Created by Nathanael Jo on 12/1/20.
//

import SwiftUI

struct ContentView: View {
    @State private var code: String = ""
    var body: some View {
        
        NavigationView {
        GradientBackground().ignoresSafeArea()
            .overlay(
            VStack{
                Text("TONTON").font(.custom("PermanentMarker-Regular", size: 60)).foregroundColor(Color(#colorLiteral(red: 1, green: 0.98, blue: 0.99, alpha: 0.94))).tracking(6)
            
               
                RoundedRectangle(cornerRadius: 30)
                .fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.800000011920929)))
                    .frame(width: 278, height: 60).overlay(TextField("Type Code Here", text: $code).font(.custom("Baloo2-Medium", size: 20)).foregroundColor(Color(#colorLiteral(red: 0.52, green: 0.52, blue: 0.52, alpha: 0.6))).multilineTextAlignment(.center))
                
                //Rectangle 1
                
                RoundedRectangle(cornerRadius: 30)
                .fill(Color(#colorLiteral(red: 0.32156863808631897, green: 0.34117648005485535, blue: 0.30588236451148987, alpha: 1)))
                .frame(width: 144, height: 42).overlay(//Submit
                    Text("Submit").font(.custom("Baloo2-Medium", size: 16)).foregroundColor(Color(#colorLiteral(red: 0.98, green: 0.98, blue: 0.98, alpha: 1))))
                
                NavigationLink(destination: NewSession()) {
                Text("Start new session").font(.custom("Baloo2-Medium", size: 16)).underline().foregroundColor(Color(#colorLiteral(red: 1, green: 0.98, blue: 0.99, alpha: 1)))
                }
            })
        }
                
    }
    
    


}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
