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
        // Setup global music library manager
        if UserDefaults.standard.array(forKey: "musicLibraries") != nil {
            MusicLibraryManager.globalManager.musicLibraries = UserDefaults.standard.array(forKey: "musicLibraries") as! [String]
        } else {
            print("Music library list is nil")
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}
