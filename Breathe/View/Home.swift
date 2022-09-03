//
//  Home.swift
//  Breathe
//
//  Created by 陈安冉 on 2022/9/3.
//

import SwiftUI

struct Home: View {
    // view properties
    @State var currentType: BreatheType = sampleType[0]
    var body: some View {
        ZStack{
            Background()
        }
    }
    
//    bg image with gradient overlays
    @ViewBuilder
    func Background() -> some View {
        GeometryReader{proxy in
            let size = proxy.size
            Image("BG")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: size.height)
                .clipped()
                .ignoresSafeArea()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
}
