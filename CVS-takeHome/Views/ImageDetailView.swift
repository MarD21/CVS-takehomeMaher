//
//  DetailView.swift
//  CVS-takeHome
//
//  Created by Maher Damouni on 9/23/22.
//

import SwiftUI

struct ImageDetailView: View {
    
    let item: ImageDetail
    var image: Image?
    
    var body: some View {
        
        VStack {
            AsyncImage(url: URL(string: item.media.imageUrl))
                .cornerRadius(10)
            Text(item.title)
                .font(.title)
            Text(item.author)
                .font(.title3)
            Text(StringFormatter.trimHeightWidth(from: item.description))
                .font(.title3)
            Spacer()
        }
    }
}
