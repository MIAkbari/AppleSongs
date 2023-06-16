//
//  API.swift
//  AppleSongs
//
//  Created by Mohammad on 6/13/23.
//

import Foundation
// https://itunes.apple.com/search?term=justin&country=dk&limit=1



enum API {
    
    enum Search {
        // search
        case search(term: String, limit: Int)
        
        var endPoint: EndPoint {
            switch self {
            case .search(let term, let limit):
                return .init(path: "/search", queryItems: ["term": term,
                                                           "country": "dk",
                                                           "limit": "\(limit)"])
                
            }
        }
    }
}
