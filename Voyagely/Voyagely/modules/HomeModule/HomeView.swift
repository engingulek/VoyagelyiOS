//
//  HomeView.swift
//  Voyagely
//
//  Created by Engin Gülek on 30.10.2024.
//

import SwiftUI
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}


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
               
                    StoryDesign(viewModel: viewModel)
                    CategoryList(viewModel: viewModel)
                MapViewOnHome(viewModel: viewModel)
                    .frame(width: UIScreen.main.bounds.width - 20 ,
                           height: UIScreen.main.bounds.height / 3.5)
                      .padding()
                   
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


