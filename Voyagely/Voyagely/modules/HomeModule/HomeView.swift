//
//  HomeView.swift
//  Voyagely
//
//  Created by Engin Gülek on 30.10.2024.
//

import SwiftUI



struct HomeView: View {
    @ObservedObject var viewModel:HomeViewModel
    var body: some View {
        VStack{
            ToolbarDesign(viewModel: viewModel)
            ScrollView {
                StoryDesign(viewModel: viewModel)
                CategoryList(viewModel: viewModel)
                ListOnHome()
                
            }
        }.onAppear{
            viewModel.onAppear()
        }
        
        
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(service: HomeService()))
}


