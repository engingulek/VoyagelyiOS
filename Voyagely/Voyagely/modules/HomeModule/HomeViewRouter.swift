//
//  HomeViewRouter.swift
//  Voyagely
//
//  Created by Engin Gülek on 31.10.2024.
//

import Foundation
import SwiftUI
protocol HomeViewRouterProtocol {
    func toSearchView(text:String) -> AnyView
}


class HomeViewRouter : HomeViewRouterProtocol{
    private var appContainer = AppContainer()
    func toSearchView(text:String) -> AnyView {
        let view = SearchView(viewModel: appContainer.resolve(SearchViewModel.self)!)
        view.viewModel.getSearchText(text: text)
        return AnyView(view)
    }
    
    
}
