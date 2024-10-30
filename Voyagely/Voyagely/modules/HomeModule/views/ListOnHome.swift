//
//  ListOnHome.swift
//  Voyagely
//
//  Created by Engin Gülek on 30.10.2024.
//

import SwiftUI

struct ListOnHome: View {
    var body: some View {
        VStack(alignment:.leading) {
            Text("Title")
                .fontWeight(.semibold)
                .font(.title2)
          
                VStack(spacing:40){
                    ForEach(0..<10, id: \.self){ index in
                        VStack(alignment:.leading){
                            Image("test1")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: .infinity)
                                .cornerRadius(10)
                            
                            VStack(alignment:.leading,spacing:10){
                                Text("Name Title")
                                    .font(.title2)
                                Text("Kadıköy/Istanbul")
                                HStack{
                                    HStack{
                                        Image(systemName: "star")
                                        Text("4,5 Rating")
                                    }
                                    
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
            
            
        }.padding()
    }
}

#Preview {
    ListOnHome()
}
