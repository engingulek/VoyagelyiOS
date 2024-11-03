//
//  CategoryList.swift
//  Voyagely
//
//  Created by Engin Gülek on 30.10.2024.
//

import SwiftUI

struct CategoryList: View {
    @ObservedObject var viewModel : HomeViewModel
    var body: some View {
        VStack(alignment:.leading,spacing: 15){
            Text("Categories")
                .fontWeight(.semibold)
                .font(.title2)
            HStack {
                ForEach(viewModel.categoires,id: \.id){ category in
                    Text(category.name)
                    
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20, corners: [.topLeft, .topRight, .bottomLeft, .bottomRight])
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray.opacity(0.7), lineWidth: 1)
                        )
                    
                }
            }
        }.padding(.vertical)
     
    }
}

#Preview {
    CategoryList(viewModel: HomeViewModel(service: HomeService()))
}
