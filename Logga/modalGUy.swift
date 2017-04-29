//
//  modalGUy.swift
//  Logga
//
//  Created by Jerry U. on 4/21/17.
//  Copyright © 2017 Lyshnia Limited. All rights reserved.
//

import Cocoa

class modalGUy: NSWindowController {

    var mainW: NSWindow = NSWindow()
    
    let dudeGuy = Dude(nibName: "Dude", bundle: nil)
    @IBOutlet var mainView: NSView!
    
    override init(window: NSWindow!) {
        super.init(window: window)
        //Initialization code here.
    }
    
    required init?(coder: (NSCoder!)){
        super.init(coder: coder);
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        self.mainView.addSubview((dudeGuy?.view)!)
        
    }
    
    //method called to display the modal window
    func beginSheet(mainWindow: NSWindow){
        self.mainW = mainWindow
        self.mainW.beginSheet(self.window!, completionHandler: nil)
    }
    
    //method called, when "Close" - Button clicked
    @IBAction func btnClicked(sender: AnyObject) {
        self.endSheet();
    }
    
    //method called to slide out the modal window
    func endSheet(){
        self.mainW.endSheet(self.window!)
        self.window!.orderOut(mainW)
    }
    
}
