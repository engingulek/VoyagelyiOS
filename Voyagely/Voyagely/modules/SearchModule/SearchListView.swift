//
//  SearchListView.swift
//  Voyagely
//
//  Created by Engin Gülek on 31.10.2024.
//

import SwiftUI

struct SearchListView: View {
    @ObservedObject var viewModel:SearchViewModel
    var body: some View {
        
        ScrollView{
            VStack(spacing:10) {
                ForEach(viewModel.searchList,id: \.id) { search in
                    HStack{
            
                        Image(systemName: "mappin")
                            .padding(10)
                            .background(Color.gray.opacity(0.2))
                            .clipShape(Circle())
                        Text("\(search.city), \(search.country)")
                        Spacer()
                    }.font(.title2)
                }
            }.padding(.horizontal)
        }
        
    }
}

#Preview {
    SearchListView(viewModel: SearchViewModel())
}
