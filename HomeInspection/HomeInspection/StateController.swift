//
//  StateController.swift
//  HomeInspection
//  
//  Singleton used to manage the state of an inspection
//
//  Created by Jared Speck on 1/11/17.
//  Copyright © 2017 Jared Speck. All rights reserved.
//

import UIKit

class StateController: ResultDataDelegate {
    
    
    
    // Properties
    private var results = [Result]()
    private var nextResultId: Int32 = 0
    
    // TODO: Need a way to get the next available inspection id from the server. Maybe use a temp id for offline cache, then assign a permanent id right before integrating into database.
    private var inspectionId: Int32? = nil
    
    
    // Default initializer - Initialized from hitting "New Inspection" on Dashboard, or on loading an inspection from the "Lookup Inspection" Page
    init() {}

    
    
    /**
     * ResultDataDelegate Function Implementations
     *
     * Takes in the result id and the item to change, updates the results,
     * then returns the value stored in the results for testing/updating the
     * calling controller's view
     */
    // Appends the results array with a new entry with the given comment id. Returns the result id of the new entry
    func userAddedResult(commentId: Int32) -> Int32 {
        results.append(Result(id: nextResultId, inspectionId: getNextInspId(), commentId: commentId))
        let returnId = nextResultId
        
        nextResultId += 1
        
        return returnId
        
    }
    func userRemovedResult(resultId: Int32) -> Int32 {
        // Not sure what to return here for error checking yet. Removing might totally break array indexing as the array collapses down, but the ids dont update to match
        return 1
    }
    // Adds one to the severity and modulos the result by 4. Returns the new severity value
    func userChangedSeverity(resultId: Int32) -> Int8 {
        self.results[Int(resultId)].severity = (self.results[Int(resultId)].severity + 1) % 4
        return self.results[Int(resultId)].severity
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
    
    
    /**
     * Checks local cache if offline, or makes query to online database to find the next
     * unused inspection id.
     * Returns a negative id if offline, storing the inspection locally. This id is
     * overwritten once the report is uploaded to the database
     * Returns a positive id if successfully assigned a permanent id in the database
     */
    func getNextInspId() -> Int32 {
        // TODO: Implement later, for now always assigns the first slot in the local inspection cache
        return -1;
    }
    
    
}
