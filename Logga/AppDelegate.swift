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
    
    var navVC : KSNavigationController?
    
    let miLad = miLady()
    

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application

        self.window!.backgroundColor = NSColor.white//NSColor(patternImage: NSImage(named: "collec.png")!)
        print("Selected Seg: \(acSwitch.selectedSegment)")
        
        navVC = KSNavigationController(rootViewController: Work!)
        navVC?.view.frame = NSMakeRect(0.0, 0.0, 480.0, 360.0) // Or use constraints if appropriate
        self.window.contentViewController = navVC
        self.window.orderFrontRegardless()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
    var currntSeg : Int = 1
    @IBAction func SwitchButton(_ sender: AnyObject) {
        switch acSwitch.selectedSegment {
        case 0:
            currntSeg == 0 ?
                self.navVC?.pushViewController(Sleeper!, animated: true) :
                self.navVC?.popViewController(Sleeper!, animated: true)
        case 1:
            currntSeg < 1 ?
                self.navVC?.pushViewController(Work!, animated: true) :
                self.navVC?.popViewController(Work!, animated: true)
        case 2:
            currntSeg < 2 ?
                self.navVC?.pushViewController(Student!, animated: true) :
                self.navVC?.popViewController(Student!, animated: true)
        default:
            self.navVC?.pushViewController(Rose!, animated: true)
        }
        currntSeg = acSwitch.selectedSegment
        print("Selected Seg: \(acSwitch.selectedSegment)")
    }
}

