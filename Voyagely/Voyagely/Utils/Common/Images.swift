//
//  Images.swift
//  Voyagely
//
//  Created by Engin Gülek on 4.11.2024.
//

import SwiftUI

struct AsyncImageLoad: View {
    let imageURL:String
    var body: some View {
        AsyncImage(url: URL(string: imageURL)) { phase in
                 if let image = phase.image {
                     image
                         .resizable()
                         .scaledToFill()
                        
                 } else if phase.error != nil {
                     Text(TextTheme.loadImageError.rawValue)
                         .foregroundColor(.red)
                         .font(.caption)
                 } else {
                    
                     ProgressView()
                 }
             }
    }
}


