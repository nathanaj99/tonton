//
//  Filter.swift
//  Tonton
//
//  Created by Jason Kohan on 12/5/20.
//

import SwiftUI
import Combine

struct Filter: View {
    var body: some View {
        GradientBackground().ignoresSafeArea()
            .overlay(
        VStack {
            DropDownGenre()
            DropDownYear()
            
            //Rectangle 3
            RoundedRectangle(cornerRadius: 24)
                .fill(Color(#colorLiteral(red: 0.1882352977991104, green: 0.20000000298023224, blue: 0.18039216101169586, alpha: 1)))
                .frame(width: 138, height: 48).overlay(
                    Text("Start").font(.custom("Baloo2-Regular", size: 24)).foregroundColor(Color(#colorLiteral(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)))
                )
        })
        
        
    }
}

struct Filter_Previews: PreviewProvider {
    static var previews: some View {
        Filter()
    }
}

//custom shape for the corners
struct RoundedCorners: Shape {
    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let w = rect.size.width
        let h = rect.size.height

        // Make sure we do not exceed the size of the rectangle
        let tr = min(min(self.tr, h/2), w/2)
        let tl = min(min(self.tl, h/2), w/2)
        let bl = min(min(self.bl, h/2), w/2)
        let br = min(min(self.br, h/2), w/2)

        path.move(to: CGPoint(x: w / 2.0, y: 0))
        path.addLine(to: CGPoint(x: w - tr, y: 0))
        path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr,
                    startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)

        path.addLine(to: CGPoint(x: w, y: h - br))
        path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br,
                    startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)

        path.addLine(to: CGPoint(x: bl, y: h))
        path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl,
                    startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)

        path.addLine(to: CGPoint(x: 0, y: tl))
        path.addArc(center: CGPoint(x: tl, y: tl), radius: tl,
                    startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)

        return path
    }
}

//each item in grid
struct GenreItem: View{
    
    @Binding var clicked : Bool
    
    var body: some View{
        RoundedRectangle(cornerRadius: 10)
            .fill(Color(#colorLiteral(red: 0.7686274647712708, green: 0.7686274647712708, blue: 0.7686274647712708, alpha: 1)))
            .frame(height: 63)
            .overlay(clicked ?
                    RoundedRectangle(cornerRadius: 10)
                .stroke(Color("Buff"), lineWidth: 3) : RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(#colorLiteral(red: 0.7686274647712708, green: 0.7686274647712708, blue: 0.7686274647712708, alpha: 1)), lineWidth: 2.5)
            )
    }
}

//dropdown for genres
struct DropDownGenre: View{
    
    @State var expand = true;
    @State var all = true;
    @State private var clicked1 = true;
    @State private var clicked2 = true;
    @State private var clicked3 = true;
    @State private var clicked4 = true;
    @State private var clicked5 = true;
    @State private var clicked6 = true;
    @State private var clicked7 = true;
    @State private var clicked8 = true;
    @State private var clicked9 = true;

    
    
    private var columns: [GridItem] = [
        //fixed is size of each and spacing is in between per row
            GridItem(.fixed(84), spacing: 16),
            GridItem(.fixed(84), spacing: 16),
            GridItem(.fixed(84), spacing: 16)
        ]
    
    var body: some View{
        VStack(spacing: -4) {
            ZStack{
                //Rectangle
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color(#colorLiteral(red: 0.9333333373069763, green: 0.9333333373069763, blue: 0.9333333373069763, alpha: 1)))
                .frame(width: 323, height: 37.4)
                    
                
                //Genre
                HStack(){
                    Text("Genre").font(.custom("Baloo2-Bold", size: 19)).foregroundColor(Color(#colorLiteral(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)))
                    
                    Spacer().frame(width:230)
                    
                    Image(systemName: expand ? "chevron.up" : "chevron.down")
                        .resizable()
                        .frame(width: 13, height: 6)
                        .foregroundColor(Color(#colorLiteral(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)))
                }
                
            }
            .onTapGesture{
                self.expand.toggle()
            }
            //if they click on it
            if expand{
                //rectangle
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color(#colorLiteral(red: 0.9583333134651184, green: 0.9583333134651184, blue: 0.9583333134651184, alpha: 0.800000011920929)))
                        .opacity(0.0)
                        .frame(width: 308, height: 290)
                        .background(RoundedCorners(tl: 0, tr: 0, bl: 25, br: 25).fill(Color(#colorLiteral(red: 0.9583333134651184, green: 0.9583333134651184, blue: 0.9583333134651184, alpha: 1))))
                    
                    //select all
                    VStack {
                        Text("Select all")
                            .font(.custom("Baloo2-Regular", size: 14))
                            .underline()
                            .foregroundColor(Color(#colorLiteral(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)))
                            .frame(width: 280, alignment: .trailing)
                            .onTapGesture{
                                all ?
                                (self.clicked1 = false,
                                self.clicked2 = false,
                                self.clicked3 = false,
                                self.clicked4 = false,
                                self.clicked5 = false,
                                self.clicked6 = false,
                                self.clicked7 = false,
                                self.clicked8 = false,
                                self.clicked9 = false
                                ) :
                                    (self.clicked1 = true,
                                    self.clicked2 = true,
                                    self.clicked3 = true,
                                    self.clicked4 = true,
                                    self.clicked5 = true,
                                    self.clicked6 = true,
                                    self.clicked7 = true,
                                    self.clicked8 = true,
                                    self.clicked9 = true)
                                
                                self.all.toggle()
                            }
                        
                        //grid of genres
                        LazyVGrid(columns: columns,
                                  alignment: .center,
                                  spacing: 16,
                                  pinnedViews:[] , content: {
                                    GenreItem(clicked: $clicked1).onTapGesture {
                                        self.clicked1.toggle()
                                    }
                                    GenreItem(clicked: $clicked2).onTapGesture {
                                        self.clicked2.toggle()
                                    }
                                    GenreItem(clicked: $clicked3).onTapGesture {
                                        self.clicked3.toggle()
                                    }
                                    GenreItem(clicked: $clicked4).onTapGesture {
                                        self.clicked4.toggle()
                                    }
                                    GenreItem(clicked: $clicked5).onTapGesture {
                                        self.clicked5.toggle()
                                    }
                                    GenreItem(clicked: $clicked6).onTapGesture {
                                        self.clicked6.toggle()
                                    }
                                    GenreItem(clicked: $clicked7).onTapGesture {
                                        self.clicked7.toggle()
                                    }
                                    GenreItem(clicked: $clicked8).onTapGesture {
                                        self.clicked8.toggle()
                                    }
                                    GenreItem(clicked: $clicked9).onTapGesture {
                                        self.clicked9.toggle()
                                    }
                                    
                        })
                    }
        
                }
            }
            
        }
    }
}

//dropdown for year
struct DropDownYear: View{
    
    @State var expand = true;
    @ObservedObject var slider = CustomSlider(start: 1960, end: 2020)
    
    var body: some View{
        VStack(spacing: -4) {
            ZStack{
                //Rectangle
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color(#colorLiteral(red: 0.9333333373069763, green: 0.9333333373069763, blue: 0.9333333373069763, alpha: 1)))
                .frame(width: 323, height: 37.4)
                
                //Genre
                HStack(){
                    Text("Year").font(.custom("Baloo2-Bold", size: 19)).foregroundColor(Color(#colorLiteral(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)))
                    
                    Spacer().frame(width:240)
                    
                    Image(systemName: expand ? "chevron.up" : "chevron.down")
                        .resizable()
                        .frame(width: 13, height: 6)
                        .foregroundColor(Color(#colorLiteral(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)))
                }
            }
            .onTapGesture{
                self.expand.toggle()
            }
            //if they click on it
            if expand{
                
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color(#colorLiteral(red: 0.9583333134651184, green: 0.9583333134651184, blue: 0.9583333134651184, alpha: 0.800000011920929)))
                        .frame(width: 310, height: 100)
                        .background(RoundedCorners(tl: 0, tr: 0, bl: 25, br: 25).fill(Color(#colorLiteral(red: 0.9583333134651184, green: 0.9583333134651184, blue: 0.9583333134651184, alpha: 1))))
                    
                    VStack {
                        Text(String(format: "%.0f", slider.lowHandle.currentValue) + " - " + String(format: "%.0f", slider.highHandle.currentValue))
                            .font(.custom("Baloo2-Regular", size: 18))
                        
                        //Slider
                        SliderView(slider: slider)
                    }
                }
            }
        }
    }
}


//everything for the slider

@propertyWrapper
struct SliderValue {
    var value: Double
    
    init(wrappedValue: Double) {
        self.value = wrappedValue
    }
    
    var wrappedValue: Double {
        get { value }
        set { value = min(max(0.0, newValue), 1.0) }
    }
}

class SliderHandle: ObservableObject {
    
    //Slider Size
    let sliderWidth: CGFloat
    let sliderHeight: CGFloat
    
    //Slider Range
    let sliderValueStart: Double
    let sliderValueRange: Double
    
    //Slider Handle
    var diameter: CGFloat = 20
    var startLocation: CGPoint
    
    //Current Value
    @Published var currentPercentage: SliderValue
    
    //Slider Button Location
    @Published var onDrag: Bool
    @Published var currentLocation: CGPoint
        
    init(sliderWidth: CGFloat, sliderHeight: CGFloat, sliderValueStart: Double, sliderValueEnd: Double, startPercentage: SliderValue) {
        self.sliderWidth = sliderWidth
        self.sliderHeight = sliderHeight
        
        self.sliderValueStart = sliderValueStart
        self.sliderValueRange = sliderValueEnd - sliderValueStart
        
        let startLocation = CGPoint(x: (CGFloat(startPercentage.wrappedValue)/1.0)*sliderWidth, y: sliderHeight/2)
        
        self.startLocation = startLocation
        self.currentLocation = startLocation
        self.currentPercentage = startPercentage
        
        self.onDrag = false
    }
    
    lazy var sliderDragGesture: _EndedGesture<_ChangedGesture<DragGesture>>  = DragGesture()
        .onChanged { value in
            self.onDrag = true
            
            let dragLocation = value.location
            
            //Restrict possible drag area
            self.restrictSliderBtnLocation(dragLocation)
            
            //Get current value
            self.currentPercentage.wrappedValue = Double(self.currentLocation.x / self.sliderWidth)
            
        }.onEnded { _ in
            self.onDrag = false
        }
    
    private func restrictSliderBtnLocation(_ dragLocation: CGPoint) {
        //On Slider Width
        if dragLocation.x > CGPoint.zero.x && dragLocation.x < sliderWidth {
            calcSliderBtnLocation(dragLocation)
        }
    }
    
    private func calcSliderBtnLocation(_ dragLocation: CGPoint) {
        if dragLocation.y != sliderHeight/2 {
            currentLocation = CGPoint(x: dragLocation.x, y: sliderHeight/2)
        } else {
            currentLocation = dragLocation
        }
    }
    
    //Current Value
    var currentValue: Double {
        return sliderValueStart + currentPercentage.wrappedValue * sliderValueRange
    }
}

class CustomSlider: ObservableObject {
    
    //Slider Size
    final let width: CGFloat = 250
    final let lineWidth: CGFloat = 6
    
    //Slider value range from valueStart to valueEnd
    final let valueStart: Double
    final let valueEnd: Double
    
    //Slider Handle
    @Published var highHandle: SliderHandle
    @Published var lowHandle: SliderHandle
    
    //Handle start percentage (also for starting point)
    @SliderValue var highHandleStartPercentage = 1.0
    @SliderValue var lowHandleStartPercentage = 0.0

    final var anyCancellableHigh: AnyCancellable?
    final var anyCancellableLow: AnyCancellable?
    
    init(start: Double, end: Double) {
        valueStart = start
        valueEnd = end
        
        highHandle = SliderHandle(sliderWidth: width,
                                  sliderHeight: lineWidth,
                                  sliderValueStart: valueStart,
                                  sliderValueEnd: valueEnd,
                                  startPercentage: _highHandleStartPercentage
                                )
        
        lowHandle = SliderHandle(sliderWidth: width,
                                  sliderHeight: lineWidth,
                                  sliderValueStart: valueStart,
                                  sliderValueEnd: valueEnd,
                                  startPercentage: _lowHandleStartPercentage
                                )
        
        anyCancellableHigh = highHandle.objectWillChange.sink { _ in
            self.objectWillChange.send()
        }
        anyCancellableLow = lowHandle.objectWillChange.sink { _ in
            self.objectWillChange.send()
        }
    }
    
}

struct SliderView: View {
    @ObservedObject var slider: CustomSlider
    
    var body: some View {
        RoundedRectangle(cornerRadius: slider.lineWidth)
            .fill(Color.gray.opacity(0.2))
            .frame(width: slider.width, height: slider.lineWidth)
            .overlay(
                ZStack {
                    //Path between both handles
                    SliderPathBetweenView(slider: slider)
                    
                    //Low Handle
                    SliderHandleView(handle: slider.lowHandle)
                        .highPriorityGesture(slider.lowHandle.sliderDragGesture)
                    
                    //High Handle
                    SliderHandleView(handle: slider.highHandle)
                        .highPriorityGesture(slider.highHandle.sliderDragGesture)
                }
            )
    }
}

struct SliderHandleView: View {
    @ObservedObject var handle: SliderHandle
    
    var body: some View {
        
        Circle()
            .frame(width: handle.diameter, height: handle.diameter)
            .foregroundColor(Color(#colorLiteral(red: 0.9607843160629272, green: 0.47843137383461, blue: 0, alpha: 1)))
            .shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 0)
            .scaleEffect(handle.onDrag ? 1.3 : 1)
            .contentShape(Rectangle())
            .position(x: handle.currentLocation.x, y: handle.currentLocation.y)
    }
}

struct SliderPathBetweenView: View {
    @ObservedObject var slider: CustomSlider
    
    var body: some View {
        Path { path in
            path.move(to: slider.lowHandle.currentLocation)
            path.addLine(to: slider.highHandle.currentLocation)
        }
        .stroke(Color.gray, lineWidth: slider.lineWidth)
    }
}
