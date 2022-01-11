//
//  PlaylistController.swift
//  Playlist
//
//  Created by Justin Lowry on 12/14/21.
//

import Foundation

class PlaylistController {
    // Shared instance
    static let shared = PlaylistController()
    
    // Source of Truth
    var playlists: [Playlist] = []
    
    // Create
    func createPlaylist(name: String) {
        let playlist = Playlist(name: name)
        playlists.append(playlist)
        saveToPersistenceStore()
        
    }
    
    // Delete
    func deletePlaylist(playlist: Playlist) {
        guard let index = playlists.firstIndex(of: playlist) else { return }
        playlists.remove(at: index)
        saveToPersistenceStore()
    }
    
    // Persistence
    func persistentStore() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = urls[0].appendingPathComponent("Playlist.json")
        return fileURL
    }
    
    // Save
    func saveToPersistenceStore() {
        do {
            let data = try JSONEncoder().encode(playlists)
            try data.write(to: persistentStore())
        } catch let e {
            print("Error encoding and saving persistence data")
            print(e)
            print(e.localizedDescription)
        }
    }
    
    // Load
    func loadFromPersistenceStore() {
        do {
            let data = try Data(contentsOf: persistentStore())
            playlists = try JSONDecoder().decode([Playlist].self, from: data)
        } catch let e {
            print("Error loading data from persistence store")
            print(e)
            print(e.localizedDescription)
        }
    }
}
