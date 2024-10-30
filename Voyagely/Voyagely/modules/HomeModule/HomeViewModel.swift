//
//  HomeViewModel.swift
//  Voyagely
//
//  Created by Engin Gülek on 30.10.2024.
//

import Foundation



class HomeViewModel : ObservableObject {
    
    private let service : HomeServiceProtocol
    @Published var categoires:[Category] = []
    @Published var stories:[Story] = []
    @Published var searchText:String = ""
    
    init(service: HomeServiceProtocol) {
        self.service = service
    }
    
    func onAppear() {
        fetchStroies()
        fetchCategories()
    }
    
    private func fetchCategories(){
        categoires = service.getCategories()
    }
    
    private func fetchStroies(){
        stories = service.getStories()
    }
    
    func searchAction(searchText:String){
        self.searchText = searchText
        print(searchText)
    }
}


