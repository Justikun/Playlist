//
//  Song.swift
//  Playlist
//
//  Created by Justin Lowry on 12/13/21.
//

import Foundation
 
class Song: Codable {
    var title: String
    var artistName: String
    
    init(title: String, artistName: String) {
        self.title = title
        self.artistName = artistName
    }
}

extension Song: Equatable {
    static func ==(lhs: Song, rhs: Song) -> Bool {
        return lhs.title == rhs.title && lhs.artistName == rhs.artistName
    }
    
}
