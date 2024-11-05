//
//  DetailView.swift
//  Voyagely
//
//  Created by Engin Gülek on 1.11.2024.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel:DetailViewModel
    var body: some View {
        ScrollView {
            VStack {
                ZStack(alignment:.top) {
                    ShowImages(images: viewModel.detail?.imageList ?? ["","","",""])
                    HStack{
                        BackButton()
                        Spacer()
                    }.padding()
                }
                
                DetailInfoView(viewModel: viewModel)
                
               
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    DetailView(viewModel: DetailViewModel())
}

