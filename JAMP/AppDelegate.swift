//
//  AppDelegate.swift
//  JAMP
//
//  Created by Luka Janković on 2018-07-14.
//  Copyright © 2018 Luka Janković. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        var songs = [MusicItem]()

        for i in 0...10 {
            songs.append(MusicItem(path: "test "+String(i), lastPlayed: Date()))
        }
        
        var album = MusicAlbum(itemList: songs)
        var lib = MusicLibrary(albumList: [album])
        
        var filePath = "/Users/luka/Temp/test.jamp"
        var data = NSKeyedArchiver.archivedData(withRootObject: lib)

        for item in lib.albumList[0].itemList {
            print(item.)
        }
        
        do {
            try data.write(to: URL(fileURLWithPath: filePath))
        } catch {
            print(error)
        }
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

