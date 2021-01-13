//
//  Matches.swift
//  Tonton
//
//  Created by Nathanael Jo on 12/5/20.
//

import SwiftUI

struct Matches: View {
    @State var matches: [Movie] = [
        Movie(id: 0, name: "Iron Man", year: "2008", rt: "95", imageName: "ironman", director: "Jon Fevreau", cast: "Nathan Jo, Jason Kohan", synopsis: "A billionaire industrialist and genius inventor, Tony Stark (Robert Downey Jr.), is conducting weapons tests overseas, but terrorists kidnap him to force him to build a devastating weapon. Instead, he builds an armored suit and upends his captors. Returning to America, Stark refines the suit and uses it to combat crime and terrorism."),
        Movie(id: 1, name: "Iron Man 2", year: "2010", rt: "85", imageName: "ironman", director: "Jon Fevreau", cast: "Nathan Jo, Jason Kohan", synopsis: "A billionaire industrialist and genius inventor, Tony Stark (Robert Downey Jr.), is conducting weapons tests overseas, but terrorists kidnap him to force him to build a devastating weapon. Instead, he builds an armored suit and upends his captors. Returning to America, Stark refines the suit and uses it to combat crime and terrorism."),
        Movie(id: 2, name: "Avengers", year: "2012", rt: "95", imageName: "ironman", director: "Jon Fevreau", cast: "Nathan Jo, Jason Kohan", synopsis: "A billionaire industrialist and genius inventor, Tony Stark (Robert Downey Jr.), is conducting weapons tests overseas, but terrorists kidnap him to force him to build a devastating weapon. Instead, he builds an armored suit and upends his captors. Returning to America, Stark refines the suit and uses it to combat crime and terrorism."),
        Movie(id: 3, name: "Wonder Woman", year: "2018", rt: "90", imageName: "ironman", director: "Jon Fevreau", cast: "Nathan Jo, Jason Kohan", synopsis: "A billionaire industrialist and genius inventor, Tony Stark (Robert Downey Jr.), is conducting weapons tests overseas, but terrorists kidnap him to force him to build a devastating weapon. Instead, he builds an armored suit and upends his captors. Returning to America, Stark refines the suit and uses it to combat crime and terrorism."),
        Movie(id: 4, name: "Wonder Woman 2", year: "2020", rt: "90", imageName: "ironman", director: "Jon Fevreau", cast: "Nathan Jo, Jason Kohan", synopsis: "A billionaire industrialist and genius inventor, Tony Stark (Robert Downey Jr.), is conducting weapons tests overseas, but terrorists kidnap him to force him to build a devastating weapon. Instead, he builds an armored suit and upends his captors. Returning to America, Stark refines the suit and uses it to combat crime and terrorism."),
        Movie(id: 5, name: "Interesting", year: "2020", rt: "90", imageName: "ironman", director: "Jon Fevreau", cast: "Nathan Jo, Jason Kohan", synopsis: "A billionaire industrialist and genius inventor, Tony Stark (Robert Downey Jr.), is conducting weapons tests overseas, but terrorists kidnap him to force him to build a devastating weapon. Instead, he builds an armored suit and upends his captors. Returning to America, Stark refines the suit and uses it to combat crime and terrorism."),
        Movie(id: 6, name: "Wow", year: "2020", rt: "90", imageName: "ironman", director: "Jon Fevreau", cast: "Nathan Jo, Jason Kohan", synopsis: "A billionaire industrialist and genius inventor, Tony Stark (Robert Downey Jr.), is conducting weapons tests overseas, but terrorists kidnap him to force him to build a devastating weapon. Instead, he builds an armored suit and upends his captors. Returning to America, Stark refines the suit and uses it to combat crime and terrorism.")
    ]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        ]
    
    var body: some View {
        ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(matches, id: \.self) { match in
                            CardAll(movie: match, onRemove: {_ in})
                        }
                    }
                    .padding(.horizontal)
                }
    }
}

struct Matches_Previews: PreviewProvider {
    static var previews: some View {
        Matches()
    }
}
