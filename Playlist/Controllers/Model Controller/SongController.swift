//
//  SongController.swift
//  Playlist
//
//  Created by Justin Lowry on 12/13/21.
//

import Foundation

class SongController {
    // CRUD
    // Create
    static func createSong(title: String, artistName: String, playlist: Playlist) {
        let song = Song(title: title, artistName: artistName)
        playlist.songs.append(song)
        PlaylistController.shared.saveToPersistenceStore()
    }
    
    // Delete
    static func deleteSong(song: Song, playlist: Playlist) {
        guard let index = playlist.songs.firstIndex(of: song) else { return }
        playlist.songs.remove(at: index)
        PlaylistController.shared.saveToPersistenceStore()
    }
}
