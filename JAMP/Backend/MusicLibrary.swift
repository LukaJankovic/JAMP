//
//  MusicLibrary.swift
//  JAMP
//
//  Created by Luka Janković on 2018-07-14.
//  Copyright © 2018 Luka Janković. All rights reserved.
//

import Foundation

class MusicItem: NSObject, NSCoding {
    var lastPlayed: Date
    var itemPath: String
    
    init(path: String, lastPlayed: Date) {
        self.itemPath = path
        self.lastPlayed = lastPlayed
    }
    
    required init(coder decoder: NSCoder) {
        if let itemPathObject = decoder.decodeObject(forKey: "itemPath") as? String {
            self.itemPath = itemPathObject
        } else {
            self.itemPath = ""
            print("Error 25")
        }
        
        if let lastPlayedObject = decoder.decodeObject(forKey: "lastPlayed") as? Date {
            self.lastPlayed = lastPlayedObject
        } else {
            self.lastPlayed = Date()
            print("Error 32")
        }
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.lastPlayed, forKey: "lastPlayed")
        coder.encode(self.itemPath, forKey: "itemPath")
    }
}


class MusicAlbum: NSObject, NSCoding {
    var itemList: [MusicItem]
    
    init(itemList: [MusicItem]) {
        self.itemList = itemList
    }
    
    required init(coder decoder: NSCoder) {
        if let itemList = decoder.decodeObject(forKey: "itemList") as? [MusicItem] {
            self.itemList = itemList
        } else {
            self.itemList = []
            print("Error 54")
        }
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.itemList, forKey: "itemList")
    }
}

class MusicLibrary: NSObject, NSCoding {
    var albumList: [MusicAlbum]
    var path: String
    var name: String = ""
    
    init(albumList: [MusicAlbum], path: String) {
        self.albumList = albumList
        self.path = path
    }
    
    required init(coder decoder: NSCoder) {
        if let albumList = decoder.decodeObject(forKey: "albumList") as? [MusicAlbum] {
            self.albumList = albumList
        } else {
            self.albumList = []
            print("Error 83")
        }
        
        if let path = decoder.decodeObject(forKey: "path") as? String {
            self.path = path
        } else {
            self.path = ""
            print("Error 90")
        }
        
        if let name = decoder.decodeObject(forKey: "name") as? String {
            self.name = name
        } else {
            self.name = ""
            print("Error 97")
        }
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.albumList, forKey: "albumList")
        coder.encode(self.path, forKey: "path")
        coder.encode(self.name, forKey: "name")
    }
}
