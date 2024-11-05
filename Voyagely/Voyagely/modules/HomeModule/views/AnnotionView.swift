//
//  AnnotionView.swift
//  Voyagely
//
//  Created by Engin Gülek on 1.11.2024.
//

import SwiftUI

struct AnnotionView: View {
    let place:NearByPlace
    var body: some View {
        VStack(spacing:2){
            AsyncImageLoad(imageURL: place.baseImage)
                .frame(width: 80,height: 50)
            Text(place.name)
            Text(place.category.name)
                .font(.caption)
            HStack {
                HStack(spacing:1){
                    Text("\(place.rating) Rating")
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                }
                    .font(.caption)
            }
        }.padding(5)
        .background(.white)
        .cornerRadius(10)
            .frame(width: 150,height: 120)
    }
}


