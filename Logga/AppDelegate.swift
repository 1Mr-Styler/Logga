//
//  AppDelegate.swift
//  Logga
//
//  Created by Jerry U. on 4/19/17.
//  Copyright © 2017 Lyshnia Limited. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    @IBOutlet weak var sView: NSView!
    
    @IBOutlet weak var dbs: NSButton!
    var mdGuy = modalGUy(windowNibName: "modalGUy");

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        sView.layer?.backgroundColor = NSColor.clearColor().CGColor
        self.window!.backgroundColor = NSColor(patternImage: NSImage(named: "collec.png")!)
        
//        dbs.col = NSColor(patternImage: NSImage(named: "btn.png")!).CGColor
        
        let pstyle = NSMutableParagraphStyle()
        pstyle.alignment = .Center
        
        dbs.attributedTitle = NSAttributedString(string: "Better Login", attributes: [ NSForegroundColorAttributeName : NSColor.whiteColor(), NSParagraphStyleAttributeName : pstyle ])
        
        
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    @IBAction func light(sender: AnyObject) {
       // mdGuy.beginSheet(self.window)
//        mdGuy.showWindow(self.window)
    }
    @IBAction func prefGuy(sender: AnyObject) {
        mdGuy.beginSheet(self.window)
    }
    
}

