//
//  CategoryList.swift
//  Voyagely
//
//  Created by Engin Gülek on 30.10.2024.
//

import SwiftUI

struct CategoryList: View {
    @ObservedObject var viewModel : HomeViewModel
    var body: some View {
        VStack(alignment:.center,spacing: 15){
            PrimaryTitle(text: TextTheme.categories.rawValue)
                HStack {
                    ForEach(viewModel.categoires,id: \.id){ category in
                        Text(category.name)
                            .padding()
                            .background(viewModel.selectedCategoryId == category.id ? Color.blue : Color.white)
                            .foregroundStyle(viewModel.selectedCategoryId == category.id ? Color.white : Color.black)
                            .cornerRadius(20)
                           
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray.opacity(0.7), lineWidth: 1)
                            ).onTapGesture {
                                viewModel.onTappedGestureCategory(selectedId: category.id)
                            }
                    }
                }
        }.padding(.vertical)
     
    }
}

#Preview {
    CategoryList(viewModel: HomeViewModel(service: HomeService()))
}
