//
//  Home.swift
//  Breathe
//
//  Created by 陈安冉 on 2022/9/3.
//

import SwiftUI

struct Home: View {
    // MARK: view properties
    @State var currentType: BreatheType = sampleType[0]
    @Namespace var animation
    var body: some View {
        ZStack{
            Background()
            
            Content()
        }
    }
    
    // MARK: Main Content
    @ViewBuilder
    func Content() -> some View{
        VStack{
            HStack{
                Text("Breathe")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Button {
                    
                } label: {
                    Image(systemName: "suit.heart")
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(width: 42, height: 42)
                        .background {
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.ultraThinMaterial)
                        }
                }
            }
            .padding()
            
            // this is something
            GeometryReader{proxy in
                let size = proxy.size
                
                VStack{
                    BreatheView(size: size)
                    
                    // MARK: View Properties
                    Text("Breathe to reduce")
                        .font(.title3)
                        .foregroundColor(.white)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10){
                            ForEach(sampleType){type in
                                Text(type.title)
                                    .foregroundColor(currentType.id == type.id ? .black : .white)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 15)
                                    .background {
                                        // MARK: matched geometry effect
                                        ZStack{
                                            if currentType.id == type.id{
                                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                                    .fill(.white)
                                            } else {
                                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                                    .stroke(.white.opacity(0.4))
                                            }
                                        }
                                    }
                            }
                        }
                    }
                }
                .frame(width: size.width, height: size.height, alignment: .bottom)
                
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
    
    // MARK: Breathe Animated Circles
    @ViewBuilder
    func BreatheView(size: CGSize) -> some View{
        // MARK: we're going to use 8 circles
        // 360/8 = 45 deg for each circle
        ZStack{
            ForEach(1...8, id: \.self){ index in
                Circle()
                    .fill(.teal.gradient.opacity(0.5))
                    .frame(width: 150, height: 150)
                
                // 150 / 2 ->
                    .offset(x: 75)
                    .rotationEffect(.init(degrees: Double(index) * 45))
            }
        }
        .frame(height: (size.width - 40))
    }
    
    // MARK:  bg image with gradient overlays
    @ViewBuilder
    func Background() -> some View {
        GeometryReader{proxy in
            let size = proxy.size
            Image("BG")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .offset(y: -110)
                .frame(width: size.width, height: size.height)
                .clipped()
                .overlay{
                    ZStack{
                        Rectangle()
                            .fill(.linearGradient(colors:[currentType.color.opacity(0.9), .clear, .clear], startPoint: .top, endPoint: .bottom))
                            .frame(height: size.height / 1.5)
                            .frame(maxHeight: .infinity, alignment: .top)
                        
                        Rectangle()
                            .fill(.linearGradient(colors:[
                                .clear,
                                .black,
                                .black,
                                .black,
                                .black
                            ], startPoint: .top, endPoint: .bottom))
                            .frame(height: size.height / 1.35)
                            .frame(maxHeight: .infinity, alignment: .bottom)
                    }
        }
    }
        .ignoresSafeArea()
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
}
