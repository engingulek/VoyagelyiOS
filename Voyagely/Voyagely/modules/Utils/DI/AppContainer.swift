//
//  AppContainer.swift
//  Voyagely
//
//  Created by Engin Gülek on 30.10.2024.
//

import Foundation
import Swinject



class AppContainer {
    let container: Container

    init() {
        container = Container()
        start() 
    }

    func start() {
        container.register(HomeService.self) { _ in
            HomeService()
        }

        container.register(HomeViewModel.self) { resolver in
            HomeViewModel(service: resolver.resolve(HomeService.self)!)
        }
    }

    
    func resolve<T>(_ type: T.Type) -> T? {
        container.resolve(type)
    }
}

