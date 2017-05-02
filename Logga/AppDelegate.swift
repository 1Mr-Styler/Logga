//
//  AppDelegate.swift
//  Logga
//
//  Created by Jerry U. on 4/19/17.
//  Copyright © 2017 Lyshnia Limited. All rights reserved.
//

import Cocoa
import WebKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var acSwitch: NSSegmentedControl!
    
    
    @IBOutlet weak var mainView: NSView!
    var activeSub = NSView()
    
    var Handler = handler(activity: Activity.working)
    
    let Sleeper = ViewController(nibName: "Sleeping", bundle: nil)
    let Student = ViewController(nibName: "Studying", bundle: nil)
    let Rose = ViewController(nibName: "Inactive", bundle: nil)
    let Work = ViewController(nibName: "Working", bundle: nil)
    
    let miLad = miLady()
    

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application

        self.window!.backgroundColor = NSColor.white//NSColor(patternImage: NSImage(named: "collec.png")!)
        print("Selected Seg: \(acSwitch.selectedSegment)")
        
        mainView.addSubview((Work?.view)!)
        activeSub = (Work?.view)!
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
    
    @IBAction func SwitchButton(_ sender: AnyObject) {
        switch acSwitch.selectedSegment {
        case 0:
            self.Handler = handler(activity: Activity.sleeping)
            mainView.addSubview((Sleeper?.view)!)
            mainView.replaceSubview(activeSub, with: (Sleeper?.view)!)
            activeSub = (Sleeper?.view)!
        case 1:
            self.Handler = handler(activity: Activity.working)
            mainView.addSubview((Work?.view)!)
            mainView.replaceSubview(activeSub, with: (Work?.view)!)
            activeSub = (Work?.view)!
        case 2:
            self.Handler = handler(activity: Activity.studying)
            mainView.addSubview((Student?.view)!)
            mainView.replaceSubview(activeSub, with: (Student?.view)!)
            activeSub = (Student?.view)!
        default:
            self.Handler = handler(activity: Activity.inactive)
            mainView.addSubview((Rose?.view)!)
            mainView.replaceSubview(activeSub, with: (Rose?.view)!)
            activeSub = (Rose?.view)!
        }
        print("Selected Seg: \(acSwitch.selectedSegment)")
    }
}

