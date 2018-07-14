//
//  MainSplitViewController.swift
//  JAMP
//
//  Created by Luka Janković on 2018-07-14.
//  Copyright © 2018 Luka Janković. All rights reserved.
//

import Foundation
import Cocoa

class mainSplitViewController: NSSplitViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func splitView(_ splitView: NSSplitView, canCollapseSubview subview: NSView) -> Bool {
        if (subview.subviews[0].identifier!.rawValue == "sidebar") {
            return true
        }
        return false
    }
}
