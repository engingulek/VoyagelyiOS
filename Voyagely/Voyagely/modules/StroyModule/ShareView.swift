//
//  StoryView.swift
//  Voyagely
//
//  Created by Engin Gülek on 4.11.2024.
//

import SwiftUI

struct ShareView: View {
    @ObservedObject var viewModel : ShareViewModel
    @Environment(\.dismiss) var dismiss
    @State private var scaleEffect: CGFloat = 0.5
    var body: some View {
        ZStack {
            Color.gray.opacity(0.5)
            AsyncImageLoad(imageURL: viewModel.viewShare?.shareImageURL ?? "")
                .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
            VStack {
                HStack {
                    BackButton()
                        .padding(.vertical,25)
                    Spacer()
                }
              
                Spacer()
                
                Text(viewModel.viewShare?.location.name ?? "")
                    .fontWeight(.semibold)
                    .font(.callout)
                    .frame(width: 150,height: 50)
                    .padding()
                    .foregroundColor(.white)
                    .background(.gray.opacity(0.3))
                    .cornerRadius(5)
                    .padding(.vertical,20)
                    .onTapGesture {
                        viewModel.onTappedLocationName()
                    }
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

