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
            Image("test1")
                .resizable()
                .frame(width: 80,height: 50)
            Text(place.name)
            Text(place.categoryName)
                .font(.caption)
            HStack {
                HStack(spacing:1){
                    Text(String(format: "%.1f", place.rating))
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                    Text("\(place.comment)")
                    Image(systemName: "message.fill")
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

#Preview {
    AnnotionView(place: NearByPlace.defaultData)
}
