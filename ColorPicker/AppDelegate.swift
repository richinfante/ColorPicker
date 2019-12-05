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
    var lastMode : NSColorPanel.Mode = .wheel
    
    func applicationDidBecomeActive(_ notification: Notification) {
        setupPanel()
        NSColorPanel.shared.makeKeyAndOrderFront(self)
    }

    func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        setupPanel()
        NSColorPanel.shared.makeKeyAndOrderFront(self)
        
        return true
    }
    
    func setupPanel() {
        NSColorPanel.shared.delegate = self
        NSColorPanel.shared.title = "Color Picker"
        NSColorPanel.shared.showsAlpha = true
        NSColorPanel.shared.hidesOnDeactivate = false
        NSColorPanel.shared.isFloatingPanel = true
        NSColorPanel.shared.titlebarAppearsTransparent = true
        NSColorPanel.shared.isMovableByWindowBackground  = true
        NSColorPanel.shared.standardWindowButton(NSWindow.ButtonType.miniaturizeButton)?.isEnabled = false
        NSColorPanel.shared.standardWindowButton(NSWindow.ButtonType.closeButton)?.isEnabled = true
    }
    
    
    func applicationWillTerminate(aNotification: NSNotification) {
        NSColorPanel.shared.close()
    }
    
    @IBAction func closeWindow(_ sender: AnyObject?) {
        NSColorPanel.shared.close()
    }
    
    func windowShouldClose(_ sender: NSWindow) -> Bool {
        if sender == NSColorPanel.shared {
            self.lastMode = NSColorPanel.shared.mode
        }
        return true
    }
    
    @objc @IBAction func openPalleteFolder(sender: AnyObject?){
        let showFolder = Process()

        showFolder.launchPath = "/usr/bin/open"
        showFolder.arguments = [NSHomeDirectory() + "/Library/Colors"]
        showFolder.launch()
    }
}

