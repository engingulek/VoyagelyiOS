//
//  ToolbarDesign.swift
//  Voyagely
//
//  Created by Engin Gülek on 30.10.2024.
//

import SwiftUI

struct ToolbarDesign: View {
    @ObservedObject var viewModel : HomeViewModel
    @State private var searchText = "a"
    var body: some View {
        VStack{
            HStack{
                VStack(alignment:.leading){
                    Text("Your Location")
                    HStack{
                        Image(systemName: "mappin.and.ellipse")
                        Text("Istanbul,Türkiye")
                    }.fontWeight(.semibold)
                }
                Spacer()
                
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
            
            
        }
        .padding()
        .padding(.bottom,20)
        .background(Color.blue)
        .foregroundStyle(.white)
    }
}

#Preview {
    ToolbarDesign(viewModel: HomeViewModel(service: HomeService()))
}