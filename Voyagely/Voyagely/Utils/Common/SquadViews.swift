//
//  SquadViews.swift
//  Voyagely
//
//  Created by Engin Gülek on 3.11.2024.
//

import SwiftUI

struct ImageAndText: View {
    let image:String
    let title:String
    var body: some View {
        HStack(spacing:2){
            Image(systemName: image)
                .foregroundStyle(.black)
                .fontWeight(.semibold)
                .font(.callout)
            Text(title)
                .foregroundStyle(.black)
                .font(.callout)
        }
    }
}

