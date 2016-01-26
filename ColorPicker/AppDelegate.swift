//
//  AppDelegate.swift
//  ColorPicker
//
//  Created by Richard Infante on 4/14/15.
//  Copyright (c) 2015 richinfante. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSWindowDelegate {

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        ColorPicker.sharedColorPanel().makeKeyAndOrderFront(self)
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        ColorPicker.sharedColorPanel().close()
    }
    
    @IBAction func openPalleteFolder(sender: AnyObject?){
        let showFolder = NSTask()

        showFolder.launchPath = "/usr/bin/open"
        showFolder.arguments = [NSHomeDirectory() + "/Library/Colors"]
        showFolder.launch()
    }
}

