//
//  BigMapRouter.swift
//  Voyagely
//
//  Created by Engin Gülek on 1.11.2024.
//

import Foundation
import SwiftUI
protocol BigMapRouterProtocol {
    func toDetail() -> AnyView
}

class BigMapRouter : BigMapRouterProtocol {
    private var appContainer = AppContainer()
    func toDetail() -> AnyView {
        let view = DetailView(viewModel: appContainer.resolve(DetailViewModel.self))
        return AnyView(view)
    }
}
