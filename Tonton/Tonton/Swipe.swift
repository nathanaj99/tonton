//
//  Swipe.swift
//  Tonton
//
//  Created by Nathanael Jo on 12/1/20.
//

import SwiftUI

struct Movie: Hashable {

    var id: Int

    let name: String
    let year: String
    let rt: String
    let imageName: String
    let director: String
    let cast: String
    let synopsis: String

}


struct Swipe: View {
    @State var movies: [Movie] = [
        Movie(id: 0, name: "Iron Man", year: "2008", rt: "95", imageName: "ironman", director: "Jon Fevreau", cast: "Nathan Jo, Jason Kohan", synopsis: "A billionaire industrialist and genius inventor, Tony Stark (Robert Downey Jr.), is conducting weapons tests overseas, but terrorists kidnap him to force him to build a devastating weapon. Instead, he builds an armored suit and upends his captors. Returning to America, Stark refines the suit and uses it to combat crime and terrorism."),
        Movie(id: 1, name: "Iron Man 2", year: "2010", rt: "85", imageName: "ironman", director: "Jon Fevreau", cast: "Nathan Jo, Jason Kohan", synopsis: "A billionaire industrialist and genius inventor, Tony Stark (Robert Downey Jr.), is conducting weapons tests overseas, but terrorists kidnap him to force him to build a devastating weapon. Instead, he builds an armored suit and upends his captors. Returning to America, Stark refines the suit and uses it to combat crime and terrorism."),
        Movie(id: 2, name: "Avengers", year: "2012", rt: "95", imageName: "ironman", director: "Jon Fevreau", cast: "Nathan Jo, Jason Kohan", synopsis: "A billionaire industrialist and genius inventor, Tony Stark (Robert Downey Jr.), is conducting weapons tests overseas, but terrorists kidnap him to force him to build a devastating weapon. Instead, he builds an armored suit and upends his captors. Returning to America, Stark refines the suit and uses it to combat crime and terrorism."),
        Movie(id: 3, name: "Wonder Woman", year: "2018", rt: "90", imageName: "ironman", director: "Jon Fevreau", cast: "Nathan Jo, Jason Kohan", synopsis: "A billionaire industrialist and genius inventor, Tony Stark (Robert Downey Jr.), is conducting weapons tests overseas, but terrorists kidnap him to force him to build a devastating weapon. Instead, he builds an armored suit and upends his captors. Returning to America, Stark refines the suit and uses it to combat crime and terrorism."),
        Movie(id: 4, name: "Wonder Woman 2", year: "2020", rt: "90", imageName: "ironman", director: "Jon Fevreau", cast: "Nathan Jo, Jason Kohan", synopsis: "A billionaire industrialist and genius inventor, Tony Stark (Robert Downey Jr.), is conducting weapons tests overseas, but terrorists kidnap him to force him to build a devastating weapon. Instead, he builds an armored suit and upends his captors. Returning to America, Stark refines the suit and uses it to combat crime and terrorism."),
        Movie(id: 5, name: "Interesting", year: "2020", rt: "90", imageName: "ironman", director: "Jon Fevreau", cast: "Nathan Jo, Jason Kohan", synopsis: "A billionaire industrialist and genius inventor, Tony Stark (Robert Downey Jr.), is conducting weapons tests overseas, but terrorists kidnap him to force him to build a devastating weapon. Instead, he builds an armored suit and upends his captors. Returning to America, Stark refines the suit and uses it to combat crime and terrorism."),
        Movie(id: 6, name: "Wow", year: "2020", rt: "90", imageName: "ironman", director: "Jon Fevreau", cast: "Nathan Jo, Jason Kohan", synopsis: "A billionaire industrialist and genius inventor, Tony Stark (Robert Downey Jr.), is conducting weapons tests overseas, but terrorists kidnap him to force him to build a devastating weapon. Instead, he builds an armored suit and upends his captors. Returning to America, Stark refines the suit and uses it to combat crime and terrorism.")
    ]
    
    private var maxID: Int {
           return self.movies.map { $0.id }.max() ?? 0
    }
    
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
//                    Circle()
//                    .fill(Color(#colorLiteral(red: 0.762499988079071, green: 0.2795833349227905, blue: 0.2795833349227905, alpha: 1)))
//                    .frame(width: 13, height: 13)
                Image("bahai-solid").resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 45)
                    .foregroundColor(.gray)
                
            }.padding()
            
            
            ZStack {
    ForEach(self.movies, id: \.self) { movie in
        Group {
            // Range Operator
            if (self.maxID - 3)...self.maxID ~= movie.id {
                CardAll(movie: movie, onRemove: { removedUser in
                    // Remove that user from our array
                    self.movies.removeAll { $0.id == removedUser.id
                    }
                }).animation(.spring())
            }
            
            
        }
    }
}
         
            
//            ZStack {
//                ForEach(self.movies, id: \.self) {mov in Group {
//                    SwipeCard(movie: mov)
//                }
//
//                }
//            }
            
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
