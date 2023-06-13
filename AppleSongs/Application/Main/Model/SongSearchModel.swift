//
//  SongSearchModel.swift
//  AppleSongs
//
//  Created by Mohammad on 6/13/23.
//

import Foundation

// MARK: - SearchModel
extension Model {
    
    struct SearchModel: Codable {
        var artistName: String?
        var trackName: String?
        var artworkUrl100: String?
        var releaseDate: String?
        var longDescription: String?

        enum CodingKeys: String, CodingKey {
            case artistName = "artistName"
            case trackName = "trackName"
            case artworkUrl100 = "artworkUrl100"
            case releaseDate = "releaseDate"
            case longDescription = "longDescription"        }
    }

}
