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
    .init(title: "Anger", color: .mint),
    .init(title: "Irritation", color: .brown),
    .init(title: "Sadness", color: .purple)
]
