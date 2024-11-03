//
//  ShowImages.swift
//  Voyagely
//
//  Created by Engin Gülek on 3.11.2024.
//

import SwiftUI

struct ShowImages: View {
    let images = ["test1","test1","test1","test1"]
    var body: some View {
        VStack {
        
            TabView {
                ForEach(0..<4, id: \.self) { i in
                    ZStack(alignment:.bottomTrailing) {
                        Image("test1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width - 20, height: 350)
                        Text("\(i+1)/\(4)")
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

#Preview {
    ShowImages()
}
