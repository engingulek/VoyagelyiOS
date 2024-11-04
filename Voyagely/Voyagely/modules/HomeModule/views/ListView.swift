//
//  ListV.swift
//  Voyagely
//
//  Created by Engin Gülek on 3.11.2024.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var viewModel:HomeViewModel
    var router : HomeViewRouterProtocol
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        VStack{
            PrimaryTitle(text: TextTheme.nearBy.rawValue)
            LazyVGrid(columns: columns) {
                ForEach(0..<10) { _ in
                    ListViewCell()
                        .onTapGesture {
                            viewModel.onTapGesturePlace(id: 1)
                        }
                }
            }
        }
    }
}


private struct ListViewCell : View {
    var body: some View {
        VStack(alignment:.leading){
            ZStack(alignment:.topLeading) {
                Image("test1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 180,height: 200)
               Text("Restaurant")
                    .font(.footnote)
                    .foregroundStyle(.white)
                    .padding(5)
                    .background(.gray.opacity(0.3))
                    .padding()
            }
            VStack(alignment:.leading){
                HStack{
                    Text("Name")
                        .font(.title3)
                    Text("$$$")
                }
                HStack(spacing:2){
                    ImageAndText(image: "star.fill", title: "4.5")
                    XSText(text:"(50 Reviews)" )
                }
                HStack(spacing:2){
                    ImageAndText(image: "mappin", title: "Bakırkoy")
                    XSText(text:"14 km")
                 
                }
            }.padding(.horizontal)
                .padding(.bottom)
        }.background(Color.white)
        .cornerRadius(10)
            .padding(.bottom)
    }
}

#Preview {
    ListView(viewModel: HomeViewModel(service: HomeService()), router: HomeViewRouter())
}
