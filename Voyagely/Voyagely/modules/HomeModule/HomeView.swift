//
//  HomeView.swift
//  Voyagely
//
//  Created by Engin Gülek on 30.10.2024.
//

import SwiftUI
import MapKit

struct HomeView: View {
    @ObservedObject var viewModel:HomeViewModel
    private var router : HomeViewRouterProtocol

    
    init(viewModel: HomeViewModel, router: HomeViewRouterProtocol) {
        self.viewModel = viewModel
        self.router = router
    }
    var body: some View {
        NavigationStack {
            ZStack {
                VStack{
                    ToolbarDesign(viewModel: viewModel)
                    ZStack(alignment:.bottom) {
                        ScrollView {
                            ShareDesign(viewModel: viewModel)
                            CategoryList(viewModel: viewModel)
                            ListView(viewModel: viewModel,
                                     router: router)
                        }
                        Button {
                            viewModel.onTappedOpenBigMapButton()
                        } label: {
                            Text(TextTheme.openBigMap.rawValue)
                        }
                        .padding()
                        .background(.blue)
                        .foregroundStyle(.white)
                        .cornerRadius(10)
                        .padding(.vertical)
                    }
                   
                }
            }
            .background(Color.gray.opacity(0.1))
            
            .onAppear{
                viewModel.onAppear()
            }
            .navigationDestination(isPresented: $viewModel.searchToView) {
                router.toSearchView(text: viewModel.searchText)
            }.navigationDestination(isPresented: $viewModel.toBigMapView) {
                router.toBigMapView()
            }.navigationDestination(isPresented: $viewModel.toDetailView) {
                router.toDetailView(id: viewModel.selectedId)
            }.fullScreenCover(isPresented: $viewModel.toStoryView) {
                router.toStoryView(share: viewModel.selectedShare)
            }
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(service: HomeService()), router: HomeViewRouter())
}


