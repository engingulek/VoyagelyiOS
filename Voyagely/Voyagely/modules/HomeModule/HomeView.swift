//
//  HomeView.swift
//  Voyagely
//
//  Created by Engin Gülek on 30.10.2024.
//

import SwiftUI



struct HomeView: View {
    
    var body: some View {
        VStack{
            ToolbarDesign()
            ScrollView {
                StoryDesign()
                CategoryList()
                ListOnHome()
                
            }
            
            
            
            
            
            
        }
        Spacer()
        
        
    }
}

#Preview {
    HomeView()
}

/*
 
 */
