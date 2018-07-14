//
//  Sidebar.swift
//  JAMP
//
//  Created by Luka Janković on 2018-07-15.
//  Copyright © 2018 Luka Janković. All rights reserved.
//

import Foundation
import Cocoa

class loading: NSViewController {
    @IBOutlet weak var infoLabel: NSTextField!
    @IBOutlet weak var progressBar: NSProgressIndicator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.progressBar.startAnimation(self)
    }
}

class Sidebar: NSView, MusicLibraryManagerDelegate {
    
    lazy var loadingVC: loading = {
        return self.window?.windowController?.storyboard!.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("loadingSheet")) as! loading
    }()
    
    func musicFound(path: String) {
        DispatchQueue.main.sync {
            self.loadingVC.infoLabel.stringValue = path
        }
    }
    
    func musicProbeFinished(success: Bool) {
        DispatchQueue.main.sync {
            self.loadingVC.dismiss(self)
        }
    }
    
    @IBAction func addPressed(_ sender: Any) {
        let panel = NSOpenPanel()
        
        panel.canChooseFiles = false
        panel.canChooseDirectories = true
        panel.allowsMultipleSelection = false
        
        panel.begin(completionHandler: { (result) -> Void in
            if result == .OK {
                let selectedPath = panel.url!.path
                
                MusicLibraryManager.globalManager.delegate = self
                MusicLibraryManager.globalManager.addNewLibrary(path: selectedPath)
                self.window?.contentViewController?.presentViewControllerAsSheet(self.loadingVC)
            }
        })
    }
}
