//
//  Texts.swift
//  Voyagely
//
//  Created by Engin Gülek on 4.11.2024.
//

import Foundation
import SwiftUI
struct PrimaryTitle : View {
    let text:String
    var body: some View {
        Text(text)
            .fontWeight(.semibold)
            .font(.title2)
    }
}


struct XSText : View {
    let text:String
    var body: some View {
        Text(text)
            .foregroundStyle(.gray.opacity(0.5))
            .font(.footnote)
            .fontWeight(.semibold)
    }
}

