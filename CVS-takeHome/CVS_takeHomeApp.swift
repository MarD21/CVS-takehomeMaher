//
//  CVS_takeHomeApp.swift
//  CVS-takeHome
//
//  Created by Maher Damouni on 9/23/22.
//

import SwiftUI

@main
struct CVS_TakeHomeApp: App {
    
    let viewModel = FlickrSearchViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeFeedView(viewModel: viewModel)
        }
    }
}
