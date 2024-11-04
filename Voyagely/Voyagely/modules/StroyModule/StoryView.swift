//
//  StoryView.swift
//  Voyagely
//
//  Created by Engin Gülek on 4.11.2024.
//

import SwiftUI

struct StoryView: View {
    let story:Share?
    @Environment(\.dismiss) var dismiss
    @State private var scaleEffect: CGFloat = 0.5
    var body: some View {
        ZStack {
            Color.gray.opacity(0.5)
            AsyncImageLoad(imageURL: story?.shareImageURL ?? "")
                .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
            VStack {
                HStack {
                    BackButton()
                        .padding(.vertical,25)
                    Spacer()
                }
              
                Spacer()
                
                Text(story?.location.name ?? "")
                    .fontWeight(.semibold)
                    .font(.callout)
                    .frame(width: 150,height: 50)
                    .padding()
                    .foregroundColor(.white)
                    .background(.gray.opacity(0.3))
                    .cornerRadius(5)
                    .padding(.vertical,20)
            }
              
        }
        .ignoresSafeArea()
        .scaleEffect(scaleEffect)
       
        .navigationBarHidden(true)
        .onAppear {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.6, blendDuration: 1)) {
                scaleEffect = 1.0
            }
        }
    }
}

