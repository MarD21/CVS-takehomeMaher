//
//  ViewModel.swift
//  CVS-takeHome
//
//  Created by Maher Damouni on 9/23/22.
//

import Foundation

class FlickrSearchViewModel: ObservableObject {
    
    @Published var pictureData = [ImageDetail]()
    @Published var searchTerm = ""
    
    init() {
        Task {
            await getPictures()
        }
    }
    
    @MainActor
    func getPictures() async -> Void {
        do {
            let data = try await NetworkManager().fetchData(for: searchTerm)
            self.pictureData = data.items
        } catch {
            print(error.localizedDescription)
        }
    }
}
