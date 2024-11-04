//
//  DetailView.swift
//  Voyagely
//
//  Created by Engin Gülek on 1.11.2024.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel:DetailViewModel
    
    let images = ["test1","test1","test1","test1"]
    var body: some View {
        ScrollView {
            VStack {
                ZStack(alignment:.top) {
                    ShowImages()
                    HStack{
                        BackButton()
                        Spacer()
                    }.padding()
                }
                
                DetailInfoView(viewModel: viewModel)
                
                VStack{
                    Text(TextTheme.reviews.rawValue)
                        .font(.title3)
                        .fontWeight(.semibold)
                    ForEach(0..<5){_ in
                       ReviewCell()
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    DetailView(viewModel: DetailViewModel())
}

