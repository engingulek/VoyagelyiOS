//
//  HomeView.swift
//  Voyagely
//
//  Created by Engin Gülek on 30.10.2024.
//

import SwiftUI



struct HomeView: View {
    @ObservedObject var viewModel:HomeViewModel
    private var router : HomeViewRouterProtocol
    init(viewModel: HomeViewModel, router: HomeViewRouterProtocol) {
        self.viewModel = viewModel
        self.router = router
    }
    var body: some View {
        NavigationStack {
            VStack{
                ToolbarDesign(viewModel: viewModel)
                ScrollView {
                    StoryDesign(viewModel: viewModel)
                    CategoryList(viewModel: viewModel)
                    ListOnHome()
                }
            }.onAppear{
                viewModel.onAppear()
            }.navigationDestination(isPresented: $viewModel.searchToView) {
                router.toSearchView(text: viewModel.searchText)
            }
        }
       
        
        
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(service: HomeService()), router: HomeViewRouter())
}


