//
//  Model.swift
//  CVS-takeHome
//
//  Created by Maher Damouni on 9/23/22.
//

import Foundation

struct ImageData: Decodable {

    let items: [ImageDetail]
}

struct ImageDetail: Identifiable, Decodable {

    let id = UUID()
    let title: String
    let media: Image
    let description: String
    let author: String
    
    private enum CodingKeys: String, CodingKey {
        case title, media, description, author
    }
}

struct Image: Decodable {
    
    let imageUrl: String
    
    private enum CodingKeys: String, CodingKey {
        case imageUrl = "m"
    }
}

