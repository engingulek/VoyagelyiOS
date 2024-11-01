//
//  VoyagelyApp.swift
//  Voyagely
//
//  Created by Engin Gülek on 30.10.2024.
//

import SwiftUI
import Swinject
@main
struct VoyagelyApp: App {
    let appContainer = AppContainer()
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: appContainer.resolve(HomeViewModel.self),
                     router: appContainer.resolve(HomeViewRouter.self) )
           
        }
    }
}
