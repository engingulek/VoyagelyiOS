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
                if viewModel.loadingAction { ProgressView() }
                else{
                    if viewModel.errorState {
                        VStack{ Text(TextTheme.errorMessageError.rawValue) }
                    }else{
                        VStack{
                            ZStack(alignment:.bottom) {
                                ScrollView {
                                    CategoryList(viewModel: viewModel)
                                    ListView(viewModel: viewModel)
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
                }
            }
            .background(Color.gray.opacity(0.1))
            .task{
                
                await viewModel.task()
                
            }.navigationDestination(isPresented: $viewModel.toBigMapView) {
                router.toBigMapView()
            }.navigationDestination(isPresented: $viewModel.toDetailView) {
                router.toDetailView(id: viewModel.selectedPlaceId)
            }
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(service: HomeService()), router: HomeViewRouter())
}


