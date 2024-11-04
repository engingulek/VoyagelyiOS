//
//  SearchViewModel.swift
//  Voyagely
//
//  Created by Engin Gülek on 31.10.2024.
//

import Foundation

class SearchViewModel : ObservableObject {
    @Published var searchText:String = ""
    @Published var searchList:[SearchModel] = []
    
    func searchAction(searchText:String){
        self.searchText = searchText
        if searchText.isEmpty{
            lastSearchList()
        }else{
            searchList = []
        }
       
    }
    
    func getSearchText(text:String){
        searchText = text
        searchAction(searchText: text)
    }
    
    private func lastSearchList(){
        searchList = [
            .init(id: 0, city: "Istanbul", country: "Türkiye"),
            .init(id: 2, city: "Paris", country: "France")
        ]
    }
    
}
