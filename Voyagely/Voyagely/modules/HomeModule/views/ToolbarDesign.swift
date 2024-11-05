//
//  ToolbarDesign.swift
//  Voyagely
//
//  Created by Engin Gülek on 30.10.2024.
//

import SwiftUI

struct ToolbarDesign: View {
    @ObservedObject var viewModel : HomeViewModel
    @State private var searchText = ""
    var body: some View {
        VStack{
            HStack{
                VStack(alignment:.leading){
                    Text(TextTheme.yourLocation.rawValue)
                    HStack{
                        Image(systemName: "mappin.and.ellipse")
                        Text("\(viewModel.locationInfo.city),\(viewModel.locationInfo.country)")
                    }.fontWeight(.semibold)
                }
                Spacer()
            }
            HStack(spacing:1) {
                Image(systemName: "magnifyingglass")
                    .font(.title)
                TextField(TextTheme.searchText.rawValue, text: $viewModel.searchText)
                    .onChange(of: viewModel.searchText) { oldValue,newValue in
                        viewModel.searchAction(searchText: newValue)
                    }.padding()
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
