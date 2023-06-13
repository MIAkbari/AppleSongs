//
//  BaseModel.swift
//  AppleSongs
//
//  Created by Mohammad on 6/13/23.
//

import Foundation

extension Model {
    
    // MARK: - BaseModel<T>
    struct BaseModel<T: Codable>: Codable {
        var resultCount: Int?
        var results: [T]?
    }
    
    // for test befor added orginal model
    struct Empty: Codable {
        // ...
    }
}
