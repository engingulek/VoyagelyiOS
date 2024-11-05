//
//  HomeViewRouter.swift
//  Voyagely
//
//  Created by Engin Gülek on 31.10.2024.
//

import Foundation
import SwiftUI
protocol HomeViewRouterProtocol {
    
    func toDetailView(id:Int?) -> AnyView
    func toBigMapView() -> AnyView
    func toStoryView(share:Share?) -> AnyView
    
}

class HomeViewRouter : HomeViewRouterProtocol{

    private var appContainer = AppContainer()
  
    
    func toDetailView(id: Int?) -> AnyView {
        let view = DetailView(viewModel: appContainer.resolve(DetailViewModel.self))
        return AnyView(view)
    }
    
    func toBigMapView() -> AnyView {
        let view = BigMapView(
            viewModel: appContainer.resolve(BigMapViewModel.self),
            router: appContainer.resolve(BigMapRouter.self)
        )
        return AnyView(view)
    }
    
    func toStoryView(share:Share?) -> AnyView {
        
        let view = ShareView(viewModel: appContainer.resolve(ShareViewModel.self))
        view.viewModel.fetchShare(share: share)
        return AnyView(view)
    }
}
