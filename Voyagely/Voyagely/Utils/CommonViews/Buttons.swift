//
//  BackButton.swift
//  Voyagely
//
//  Created by Engin Gülek on 3.11.2024.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Button {
            dismiss()
        } label: {
            
            Image(systemName: "chevron.backward")
                .padding()
                .background(.white)
                .clipShape(Circle())
                .padding()
                .font(.callout)
                .foregroundStyle(.black)
                .fontWeight(.semibold)
        }

    }
}


struct FavButton:View {
    let state:Bool = false
    var body: some View {
        Image(systemName: state ? "heart.fill" : "heart")
            .padding()
            .background(.white)
            .clipShape(Circle())
            .padding()
            .font(.callout)
            .foregroundStyle(.black)
            .fontWeight(.semibold)
    }
}

