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
        //Home Service
        container.register(HomeService.self) { _ in
            HomeService()
        }

        //HomeViewModel
        container.register(HomeViewModel.self) { resolver in
            HomeViewModel(service: resolver.resolve(HomeService.self)!)
        }
        
        // SearchViewModel
        container.register(SearchViewModel.self) { resolver in
            SearchViewModel()
            
        }
        
        // HomeViewRouter
        container.register(HomeViewRouter.self) { resolver in
            HomeViewRouter()
        }
    }

    
    func resolve<T>(_ type: T.Type) -> T {
        guard let resolveResult = container.resolve(type) else{
            fatalError("\(type) not found")
        }
        return resolveResult
     
    }
}

