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
    
    var Handler = handler(activity: Activity.Working)
    
    let Sleeper = ViewController(nibName: "Sleeping", bundle: nil)
    let Student = ViewController(nibName: "Studying", bundle: nil)
    let Rose = ViewController(nibName: "Inactive", bundle: nil)
    let Work = ViewController(nibName: "Working", bundle: nil)
    

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        self.window!.backgroundColor = NSColor.whiteColor()//NSColor(patternImage: NSImage(named: "collec.png")!)
        print("Selected Seg: \(acSwitch.selectedSegment)")
        
        mainView.addSubview((Work?.view)!)
        activeSub = (Work?.view)!
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(sender: NSApplication) -> Bool {
        return true
    }
    
    @IBAction func SwitchButton(sender: AnyObject) {
        switch acSwitch.selectedSegment {
        case 0:
            self.Handler = handler(activity: Activity.Sleeping)
            mainView.addSubview((Sleeper?.view)!)
            mainView.replaceSubview(activeSub, with: (Sleeper?.view)!)
            activeSub = (Sleeper?.view)!
        case 1:
            self.Handler = handler(activity: Activity.Working)
            mainView.addSubview((Work?.view)!)
            mainView.replaceSubview(activeSub, with: (Work?.view)!)
            activeSub = (Work?.view)!
        case 2:
            self.Handler = handler(activity: Activity.Studying)
            mainView.addSubview((Student?.view)!)
            mainView.replaceSubview(activeSub, with: (Student?.view)!)
            activeSub = (Student?.view)!
        default:
            self.Handler = handler(activity: Activity.Inactive)
            mainView.addSubview((Rose?.view)!)
            mainView.replaceSubview(activeSub, with: (Rose?.view)!)
            activeSub = (Rose?.view)!
        }
        print("Selected Seg: \(acSwitch.selectedSegment)")
    }
}

