//
//  ShowImages.swift
//  Voyagely
//
//  Created by Engin Gülek on 3.11.2024.
//

import SwiftUI

struct ShowImages: View {
    let images : [String]
    var body: some View {
        VStack {
            TabView {
                ForEach(0..<images.count, id: \.self) { i in
                    ZStack(alignment:.bottomTrailing) {
                        AsyncImageLoad(imageURL: images[i])
                            .frame(width: UIScreen.main.bounds.width - 20, height: 350)
                        Text("\(i+1)/\(images.count)")
                            .padding()
                            .background(.white)
                            .cornerRadius(10)
                            .padding()
                    }
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(width: UIScreen.main.bounds.width - 20, height: 350)
            .cornerRadius(20)
        }
    }
}


