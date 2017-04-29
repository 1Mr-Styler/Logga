//
//  handler.swift
//  Logga
//
//  Created by Jerry U. on 4/29/17.
//  Copyright © 2017 Lyshnia Limited. All rights reserved.
//

import Cocoa

class handler: NSObject {
    
    var activity : Activity
    
    init(activity: Activity) {
        self.activity = activity
    }
    
    func displayView() {
        
    }
    
}

enum Activity {
    case sleeping
    case working
    case studying
    case inactive
    
    func getView() -> ViewController {
        switch self {
        case .sleeping:
            return ViewController(nibName: "Sleeping", bundle: nil)!
        case .working:
            return ViewController(nibName: "Working", bundle: nil)!
        case .studying:
            return ViewController(nibName: "Studying", bundle: nil)!
        case .inactive:
            return ViewController(nibName: "Inactive", bundle: nil)!
        }
    }
    
    
}
