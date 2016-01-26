//
//  ColorPicker.swift
//  ColorPicker
//
//  Created by Richard Infante on 4/14/15.
//  Copyright (c) 2015 richinfante. All rights reserved.
//

import Foundation
import Cocoa

class ColorPicker : NSColorPanel {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.title = "Color Picker"
        self.showsAlpha = true
        self.hidesOnDeactivate = false
        self.titlebarAppearsTransparent = true
        self.movableByWindowBackground  = true
        self.standardWindowButton(NSWindowButton.MiniaturizeButton)?.enabled = true
        self.standardWindowButton(NSWindowButton.CloseButton)?.enabled = false
    }
    
    override init(contentRect: NSRect, styleMask aStyle: Int, backing bufferingType: NSBackingStoreType, `defer` flag: Bool) {
        super.init(contentRect: contentRect, styleMask: aStyle, backing: bufferingType, `defer`: flag)
        self.title = "Color Picker"
        self.hidesOnDeactivate = false
        self.showsAlpha = true
        self.titlebarAppearsTransparent = true
        self.movableByWindowBackground  = true
        self.standardWindowButton(NSWindowButton.MiniaturizeButton)?.enabled = true
        self.standardWindowButton(NSWindowButton.CloseButton)?.enabled = false
    }
}
