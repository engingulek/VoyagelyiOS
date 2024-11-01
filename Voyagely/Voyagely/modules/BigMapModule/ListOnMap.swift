//
//  ListOnHome.swift
//  Voyagely
//
//  Created by Engin Gülek on 30.10.2024.
//

import SwiftUI

struct ListOnMap: View {
    @ObservedObject var viewModel:BigMapViewModel
    
    var body: some View {
        VStack(alignment:.leading) {
            ScrollView(.horizontal){
                HStack(spacing:40){
                    ForEach(0..<10, id: \.self){ index in
                        ListSubView()
                            .padding()
                            .background(.white)
                            .cornerRadius(10)
                            .onTapGesture {
                                viewModel.onTappedPlace()
                            }
                    }
                }
            }
        }.padding()
    }
}


private struct ListSubView : View {
    var body: some View {
        VStack(alignment:.leading){
            Image("test1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200)
                .frame(height: 150)
            
                .cornerRadius(10)
            
            VStack(alignment:.leading,spacing:10){
                Text("Name Title")
                    .font(.title2)
                Text("Kadıköy/Istanbul")
                VStack(alignment:.leading){
                    HStack{
                        Image(systemName: "star")
                        Text("4,5 Rating")
                    }
                    HStack{
                        HStack{
                            Image(systemName: "mappin.and.ellipse")
                            Text("1.2 Km")
                        }
                        
                        HStack{
                            Image(systemName: "text.justify")
                            Text("20 Reviews")
                        }
                    }
                    
                }
            }
        }
    }
}

#Preview {
    ListOnMap(viewModel: BigMapViewModel())
}
