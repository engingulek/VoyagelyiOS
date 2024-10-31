//
//  SearchView.swift
//  Voyagely
//
//  Created by Engin Gülek on 31.10.2024.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel:SearchViewModel
    @Environment(\.dismiss) var dismiss
   
    var body: some View {
        VStack{
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                        .font(.title2)
                        .foregroundStyle(.black)
                        .fontWeight(.semibold)
                }

                HStack(spacing:1) {
                    Image(systemName: "magnifyingglass")
                        .font(.title)
                    TextField("Search...", text: $viewModel.searchText)
                        .onChange(of: viewModel.searchText) { oldValue,newValue in
                            viewModel.searchAction(searchText: newValue)
                        }
                    
                        .padding()
                }
                .padding(.horizontal)
                .padding(.vertical,3)
                .background(Color.white)
                .cornerRadius(20)
                .foregroundStyle(.black)
            }.padding(.horizontal)
         SearchListView(viewModel: viewModel)
            
        }.navigationBarHidden(true)
    }
}

#Preview {
    SearchView(viewModel: SearchViewModel())
}
