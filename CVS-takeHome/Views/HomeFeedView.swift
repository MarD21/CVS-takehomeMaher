//
//  ContentView.swift
//  CVS-takeHome
//
//  Created by Maher Damouni on 9/23/22.
//

import SwiftUI

struct HomeFeedView: View {
    
    @ObservedObject var viewModel: FlickrSearchViewModel
    
    var layout = [
        GridItem(.flexible(minimum: 100, maximum: 200)),
        GridItem(.flexible(minimum: 100, maximum: 200)),
        GridItem(.flexible(minimum: 100, maximum: 200))
    ]
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: layout, spacing: 10) {
                    ForEach(viewModel.pictureData) { item in
                        NavigationLink(destination: { ImageDetailView(item: item) }, label: {
                            AsyncImage(url: URL(string: item.media.imageUrl), content: { image in
                                image
                                    .resizable()
                                    .cornerRadius(10)
                            }, placeholder: {
                                ProgressView()
                            })
                            .frame(width: 120, height: 120)
                        })
                    }
                }
            }
            .searchable(text: $viewModel.searchTerm)
            .onChange(of: viewModel.searchTerm) { _ in
                startSearch()
            }
            .navigationTitle("Flickr Image Search")
        }
        .navigationViewStyle(.stack)
    }
    
    func startSearch() {
        Task {
            await viewModel.getPictures()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = FlickrSearchViewModel()
        HomeFeedView(viewModel: viewModel)
    }
}

