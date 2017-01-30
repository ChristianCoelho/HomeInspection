//
//  StateController.swift
//  HomeInspection
//
//  Created by Jared Speck on 1/11/17.
//  Copyright © 2017 Jared Speck. All rights reserved.
//

import UIKit

class StateController: ResultDataDelegate {
    
    // Properties
    var results = [Result]()

    
    
    // StateController Initializer
    init() {
        
    }

    
    
    /**
     * ResultDataDelegate Function Implementations
     *
     * Takes in the result id and the item to change, updates the results,
     * then returns the value stored in the results for testing/updating the
     * calling controller's view
     */
    func userChangedSeverity(resultId: Int32, severity: Int8) -> Int8 {
        return severity
    }
    
    func userChangedNote(resultId: Int32, note: String) -> String {
        return note
    }
    
    func userChangedPhoto(resultId: Int32, photoPath: String) -> String {
        return photoPath
    }
    
    func userChangedFlags(resultId: Int32, flagNums: [Int8]) -> [Int8] {
        return flagNums
    }
    
    
    
    // Other Functions
    
}
