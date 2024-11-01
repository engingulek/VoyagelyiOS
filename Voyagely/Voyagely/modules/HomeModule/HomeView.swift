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
                ZStack(alignment:.bottom) {
                    MapViewOnHome(viewModel: viewModel,router: router)
                        .frame(width: UIScreen.main.bounds.width - 20 ,
                               height: UIScreen.main.bounds.height / 3.5)
                          .padding()
                    
                    Button {
                        viewModel.onTappedOpenBigMapButton()
                    } label: {
                        Text("Open Big Map")
                        
                    }
                    .padding()
                    .background(.blue)
                        .foregroundStyle(.white)
                        .cornerRadius(10)
                        .padding(.vertical)
                }
            }.onAppear{
                viewModel.onAppear()
              
            }.navigationDestination(isPresented: $viewModel.searchToView) {
                router.toSearchView(text: viewModel.searchText)
            }.navigationDestination(isPresented: $viewModel.toBigMapView) {
                router.toBigMapView()
            }
        }
        
        
        
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(service: HomeService()), router: HomeViewRouter())
}


