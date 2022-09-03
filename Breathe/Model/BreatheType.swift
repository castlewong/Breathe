//
//  BreatheType.swift
//  Breathe
//
//  Created by 陈安冉 on 2022/9/3.
//

import SwiftUI

// Type Model And Sample Types
struct BreatheType: Identifiable,Hashable{
    var id: String = UUID().uuidString
    var title: String
    var color: Color
}
let sampleType: [BreatheType] = [
    .init(title: "Anger", color: Color("Mint")),
    .init(title: "Irritation", color: Color("Brown")),
    .init(title: "Sadness", color: Color("Purple"))
]
