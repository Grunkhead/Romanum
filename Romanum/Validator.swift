//
//  Validator.swift
//  Romanum
//
//  Created by Dave Buitenhuis on 05-12-16.
//  Copyright © 2016 Dave Buitenhuis. All rights reserved.
//

import Foundation

class Validator : DataManager {
    
    func checkForValidInt(value: AnyObject) -> Any {
    
        if (Int(value as! String) != nil) {
            
            return value;
        }
        return false
    }
}
