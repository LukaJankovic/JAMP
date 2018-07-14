//
//  MusicLibraryManager.swift
//  JAMP
//
//  Created by Luka Janković on 2018-07-14.
//  Copyright © 2018 Luka Janković. All rights reserved.
//

import Foundation

extension String {
    
    func fileName() -> String {
        return NSURL(fileURLWithPath: self).deletingPathExtension?.lastPathComponent ?? ""
    }
    
    func fileExtension() -> String {
        return NSURL(fileURLWithPath: self).pathExtension ?? ""
    }
}

class MusicLibraryManager {
    static let globalManager = MusicLibraryManager()
    weak var delegate: MusicLibraryManagerDelegate?
    
    var musicLibraries: [String] = []
    
    func probeMusic(path: String) -> [String] {
        
        var musicList = [String]()
        
        let fm = FileManager.default
        fm.changeCurrentDirectoryPath(path)
        
        let direnum = fm.enumerator(atPath: path)
        
        for item in direnum! {
            let file = path+"/"+(item as! String)
            let fileExtension = file.fileExtension() as CFString
            let fileUTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, fileExtension, nil)?.takeRetainedValue()
            
            if UTTypeConformsTo(fileUTI!, kUTTypeAudio) {
                self.delegate?.musicFound(path: (item as! String))
                musicList.append(file)
            }
        }
        
        return musicList
    }
    
    func addNewLibrary(path: String) -> Void {
        self.musicLibraries.append(path)
        UserDefaults.standard.set(self.musicLibraries, forKey: "musicLibraries")
        
        DispatchQueue.global(qos: .userInteractive).async {
            print(self.probeMusic(path: path))
            self.delegate?.musicProbeFinished(success: true)
        }
    }
}

protocol MusicLibraryManagerDelegate: AnyObject {
    func musicFound(path: String)
    func musicProbeFinished(success: Bool)
}
