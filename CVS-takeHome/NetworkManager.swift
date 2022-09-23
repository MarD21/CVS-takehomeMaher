//
//  NetworkManager.swift
//  CVS-takeHome
//
//  Created by Maher Damouni on 9/23/22.
//

import Foundation

struct NetworkManager {
    
    func fetchData(for searchTerm: String) async throws -> ImageData {
        
        let url = try makeURL(query: searchTerm)
        
        let (imageData, response) = try await URLSession.shared.data(from: url)
        if let httpResponse = response as? HTTPURLResponse {
            let statusCode = httpResponse.statusCode
            if statusCode >= 500 {
                throw NetworkError.serverError
            } else if statusCode >= 400  {
                throw NetworkError.clientError
            } else if statusCode >= 300  {
                throw NetworkError.redirectionMessage
            }
        }
        return try JSONDecoder().decode(ImageData.self, from: imageData)
    }
    
    
    private func makeURL(query: String) throws -> URL {
        guard var components = URLComponents(string: FlickrAPI.basePath.rawValue) else {
            throw NetworkError.unableToCreateURL
        }
        components.queryItems = [
            URLQueryItem(name: SearchQueryKey.format.rawValue, value: "json"),
            URLQueryItem(name: SearchQueryKey.noJSONCallback.rawValue, value: "1"),
            URLQueryItem(name: SearchQueryKey.tags.rawValue, value: query)
        ]
        guard let url = components.url else {
            throw NetworkError.invalidQuery
        }
        return url
    }
    
    private enum FlickrAPI: String {
        case basePath = "https://api.flickr.com/services/feeds/photos_public.gne"
    }
    
    private enum SearchQueryKey: String {
        case format, tags
        case noJSONCallback = "nojsoncallback"
    }
    
    private enum NetworkError: Error {
        case unableToCreateURL
        case invalidQuery
        case redirectionMessage
        case clientError
        case serverError
    }
}

