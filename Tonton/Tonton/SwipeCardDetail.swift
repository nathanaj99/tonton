//
//  SwipeCardDetail.swift
//  Tonton
//
//  Created by Nathanael Jo on 12/5/20.
//

import SwiftUI

struct SwipeCardDetail: View {
    @State private var translation: CGSize = .zero
    @State private var swipeStatus: LikeDislike = .none
    
    private var movie: Movie
    private var onRemove: (_ movie: Movie) -> Void
    
    private var threshold: CGFloat = 0.5
    
    private enum LikeDislike: Int {
        case like, dislike, none
    }
    
    init(movie: Movie, onRemove: @escaping(_ movie: Movie) -> Void) {
        self.movie = movie
        self.onRemove = onRemove
    }
    
    /// What percentage of our own width have we swipped
        /// - Parameters:
        ///   - geometry: The geometry
        ///   - gesture: The current gesture translation value
    private func getGesturePercentage(_ geometry: GeometryProxy, from gesture: DragGesture.Value) -> CGFloat {
            gesture.translation.width / geometry.size.width
        }
    
    var body: some View {
        VStack {
            
            //GeometryReader { geometry in
                ZStack(alignment: .top, content: {
                
                //movie poster
                    Image(self.movie.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 336, height: 601)
                    .clipShape(RoundedRectangle(cornerRadius: 32))
                    .frame(width: 336, height: 601)
                
                
            //Rectangle
                    RoundedRectangle(cornerRadius: 33)
                        .fill(Color(#colorLiteral(red: 0.07058823853731155, green: 0.0784313753247261, blue: 0.125490203499794, alpha: 1)))
                    .frame(width: 336.2, height: 601.4)
                    .opacity(0.8)
                    
                    if self.swipeStatus == .like {
                       Text("LIKE")
                            .font(.headline)
                            .padding()
                            .cornerRadius(10)
                            .foregroundColor(Color.green)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.green, lineWidth: 3.0)
                        ).padding(24)
                            .rotationEffect(Angle.degrees(-45))
                    } else if self.swipeStatus == .dislike {
                        Text("DISLIKE")
                            .font(.headline)
                            .padding()
                            .cornerRadius(10)
                            .foregroundColor(Color.red)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.red, lineWidth: 3.0)
                        ).padding(.top, 45)
                            .rotationEffect(Angle.degrees(45))
                    }
                
                    VStack(spacing: 20) {
                        //Iron Man (2008)
                        Text(self.movie.name).font(.custom("Baloo2-Bold", size: 25)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))) +
                            Text(" (").font(.custom("Baloo2-Bold", size: 25)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))) +
                            Text(self.movie.year).font(.custom("Baloo2-Bold", size: 25)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))) +
                            Text(")").font(.custom("Baloo2-Bold", size: 25)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        
                        //Director: Jon Favreau
                        Text("Director: ").font(.custom("Baloo2-Bold", size: 20)).foregroundColor(Color(#colorLiteral(red: 1, green: 0.97, blue: 0.95, alpha: 1))) + Text(self.movie.director).font(.custom("Baloo2-Medium", size: 20)).foregroundColor(Color(#colorLiteral(red: 1, green: 0.97, blue: 0.95, alpha: 1)))
                        
                        
                        //Cast: Robert Downey Jr., J...
                        Text("Cast: ").font(.custom("Baloo2-Bold", size: 20)).foregroundColor(Color(#colorLiteral(red: 1, green: 0.97, blue: 0.95, alpha: 1))) + Text(self.movie.cast).font(.custom("Baloo2-Medium", size: 20)).foregroundColor(Color(#colorLiteral(red: 1, green: 0.97, blue: 0.95, alpha: 1)))
                        
                        //A billionaire industrialis...
                        Text(self.movie.synopsis).font(.custom("Baloo2-Medium", size: 18)).foregroundColor(Color(#colorLiteral(red: 1, green: 0.97, blue: 0.95, alpha: 1))).lineSpacing(0.5).multilineTextAlignment(.center)
                    }.frame(width: 300, height: 601)
                
            })
           // }
        }
    }
}

struct SwipeCardDetail_Previews: PreviewProvider {
    static var previews: some View {
        SwipeCardDetail(movie: Movie(id: 0, name: "Iron Man", year: "2008", rt: "95", imageName: "ironman", director: "Jon Fevreau", cast: "Nathan Jo, Jason Kohan", synopsis: "A billionaire industrialist and genius inventor, Tony Stark (Robert Downey Jr.), is conducting weapons tests overseas, but terrorists kidnap him to force him to build a devastating weapon. Instead, he builds an armored suit and upends his captors. Returning to America, Stark refines the suit and uses it to combat crime and terrorism."), onRemove: { _ in})
    }
}
