//
//  image.swift
//  Tonton
//
//  Created by Nathanael Jo on 12/1/20.
//

import SwiftUI

struct image: View {
    var body: some View {
        Image("test").frame(width: 300.0, height: 300.0)
            .clipShape(Circle())
            .overlay(Circle().stroke(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/, lineWidth: 2)).shadow(radius: 10)
        
    }
}

struct image_Previews: PreviewProvider {
    static var previews: some View {
        image()
    }
}
