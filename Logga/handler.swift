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
    case Sleeping
    case Working
    case Studying
    case Inactive
    
    func getView() -> ViewController {
        switch self {
        case .Sleeping:
            return ViewController(nibName: "Sleeping", bundle: nil)!
        case .Working:
            return ViewController(nibName: "Working", bundle: nil)!
        case .Studying:
            return ViewController(nibName: "Studying", bundle: nil)!
        case .Inactive:
            return ViewController(nibName: "Inactive", bundle: nil)!
        }
    }
    
    
}