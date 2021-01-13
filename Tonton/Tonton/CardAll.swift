//
//  CardAll.swift
//  Tonton
//
//  Created by Nathanael Jo on 12/5/20.
//

import SwiftUI

struct CardAll: View {
    @State private var translation: CGSize = .zero
    // @State private var swipeStatus: LikeDislike = .none
    @State private var flipped = false
    @State private var animate3d = false
    private var movie: Movie
    private var onRemove: (_ movie: Movie) -> Void
    
    private var threshold: CGFloat = 0.5
    
//    private enum LikeDislike: Int {
//        case like, dislike, none
//    }
//
    private func getGesturePercentage(_ geometry: GeometryProxy, from gesture: DragGesture.Value) -> CGFloat {
            gesture.translation.width / geometry.size.width
        }
//    init(movie: Movie) {
//        self.movie = movie
//    }
    
    init(movie: Movie, onRemove: @escaping(_ movie: Movie) -> Void) {
        self.movie = movie
        self.onRemove = onRemove
    }
    
      var body: some View {

            VStack {
                GeometryReader { geometry in
                  ZStack() {
                    SwipeCard(movie: self.movie, onRemove: {_ in}).opacity(flipped ? 0.0 : 1.0)
                    SwipeCardDetail(movie: self.movie, onRemove: {_ in}).opacity(flipped ? 1.0 : 0.0)
                  }
                  .modifier(FlipEffect(flipped: $flipped, angle: animate3d ? 180 : 0, axis: (x: 0, y: 1)))
                  .onTapGesture {
                    withAnimation(Animation.linear(duration: 1.5)) {
                              self.animate3d.toggle()
                        }
                  }
                  .shadow(radius: 5)
                      .position(x:geometry.frame(in:.global).midX, y: 290)
                      .animation(.interactiveSpring())
                  .offset(x: self.translation.width, y: 0)
                  .rotationEffect(.degrees(Double(self.translation.width/geometry.size.width) * 25), anchor: .bottom)
                  .gesture(
                      DragGesture()
                          .onChanged { value in self.translation = value.translation
                              
//              if (self.getGesturePercentage(geometry, from: value)) >= self.threshold {
//                  self.swipeStatus = .like
//              } else if self.getGesturePercentage(geometry, from: value) <= -self.threshold {
//                  self.swipeStatus = .dislike
//              } else {
//                  self.swipeStatus = .none
//              }
              }.onEnded { value in
                  if abs(self.getGesturePercentage(geometry, from: value)) > self.threshold {
                  self.onRemove(self.movie)
              } else {
                  self.translation = .zero
              } })
                }
            }
      }
}

struct FlipEffect: GeometryEffect {

      var animatableData: Double {
            get { angle }
            set { angle = newValue }
      }

      @Binding var flipped: Bool
      var angle: Double
      let axis: (x: CGFloat, y: CGFloat)

      func effectValue(size: CGSize) -> ProjectionTransform {

            DispatchQueue.main.async {
                  self.flipped = self.angle >= 90 && self.angle < 270
            }

            let tweakedAngle = flipped ? -180 + angle : angle
            let a = CGFloat(Angle(degrees: tweakedAngle).radians)

            var transform3d = CATransform3DIdentity;
            transform3d.m34 = -1/max(size.width, size.height)

            transform3d = CATransform3DRotate(transform3d, a, axis.x, axis.y, 0)
            transform3d = CATransform3DTranslate(transform3d, -size.width/2.0, -size.height/2.0, 0)

            let affineTransform = ProjectionTransform(CGAffineTransform(translationX: size.width/2.0, y: size.height / 2.0))

            return ProjectionTransform(transform3d).concatenating(affineTransform)
      }
}

struct CardAll_Previews: PreviewProvider {
    static var previews: some View {
        CardAll(movie: Movie(id: 0, name: "Iron Man", year: "2008", rt: "95", imageName: "ironman", director: "Jon Fevreau", cast: "Nathan Jo, Jason Kohan", synopsis: "A billionaire industrialist and genius inventor, Tony Stark (Robert Downey Jr.), is conducting weapons tests overseas, but terrorists kidnap him to force him to build a devastating weapon. Instead, he builds an armored suit and upends his captors. Returning to America, Stark refines the suit and uses it to combat crime and terrorism."), onRemove: {_ in})
    }
}
