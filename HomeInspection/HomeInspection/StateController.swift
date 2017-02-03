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

class StateController {
    
    /**
     * State Variable
     *
     * Holds the State controller singleton, managing the current state of a single inspection.
     */
    static let state = StateController();
    
    // Default initializer - Hidden to prevent reinitializing state. If one needs to load new values, use the loadState function (not implemented yet).
    private init() {
        loadInitialComments();
        loadInitialSubSections();
        loadInitialSections();
    }
    
    
    
    /* Properties */
    
    // TODO: Need a way to get the next available inspection id from the server. Maybe use a temp id for offline cache, then assign a permanent id right before integrating into database.
    private var inspectionId: Int32? = nil
    private var nextResultId: Int32 = 0
    
    // Arrays are indexed by their respective unique id's
    
    // List of inspection results with unique resultId
    private var results = [Result]()
    
    // List of all section names with unique sectionId
    private var sections = [Section]()
    
    // List of all subsection names with unique subSectionId
    private var subsections = [SubSection]()
    
    // List of all comments with unique commentId
    private var comments = [Comment]()
    
    // Mapping for section num, subsection num, and comment num in a subsection to a single commentId. NEED TO FIX MAPPING FUNCTION THAT FILLS THESE IN CORRECTLY
    private var commentIds = [[[Int]]](repeating: ([[Int]](repeating: ([Int](repeating: 1, count: 30)), count: 20)), count: 10)
    
    /* End of Properties */
    
    
    /**
     * Function Implementations for transmitting data to/from UI
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
    
    // Translates the cells location into a comment id
    func getCommentId(section: Int, subSection: Int, row: Int) -> Int? {
        return commentIds[section][subSection][row];
    }
    
    // Gets the status of the comment with id commentId from the comment table
    func getCommentState(commentId: Int) -> Bool {
        return comments[commentId].active;
    }
    
    func getCommentText(commentId: Int) -> String {
        return comments[commentId].commentText
    }
    
    // End of UI data transfer functions
    
    
    
    
    // Other Functions
    
    /**
     * Checks local cache if offline, or makes query to online database to find the next
     * unused inspection id.
     * Returns a negative id if offline, storing the inspection locally. This id is
     * overwritten once the report is uploaded to the database
     * Returns a positive id if successfully assigned a permanent id in the database
     */
    func mapCommentId(commentId: Int!, sectionNum: Int!, subSectionNum: Int!, rowNum: Int!) {
        commentIds[sectionNum][subSectionNum][rowNum] = commentId;
    }
    
    func getNextInspId() -> Int32 {
        // TODO: Implement later, for now always assigns the first slot in the local inspection cache
        return -1;
    }
    
    
    // Loads the initial comments into the comments table (reserved comments for use when adding notes if that is still the plan)
    func loadInitialComments() {
        comments.append(Comment(commentId: 0, subSectionId: 0, section: 0, commentText: "", defaultFlags: [], active: true))
        comments.append(Comment(commentId: 1, subSectionId: 1, section: 1, commentText: "Sample Comment 1: Bad driveway. Boooo", defaultFlags: [1, 2], active: false))
        comments.append(Comment(commentId: 2, subSectionId: 2, section: 1, commentText: "Sample Comment 2: Ignore the next comment. It's a liar", defaultFlags: [2, 4], active: false))
        comments.append(Comment(commentId: 3, subSectionId: 2, section: 1, commentText: "Sample Comment 3: Listen to the previous comment. It's the truth", defaultFlags: [3, 5], active: false))
    }
    
    // Loads Sample subsections in for testing (This will be handled by the database integration code once implemented)
    func loadInitialSubSections() {
        subsections.append(SubSection(subSectionId: 1, name: "Sample Sub: Driveway", sectionId: 1))
        subsections.append(SubSection(subSectionId: 2, name: "Sample Sub: Paradox", sectionId: 1))
    }
    
    // Loads Sample sections in for testing (This will also be handled by the database integration code once implemented)
    func loadInitialSections() {
        sections.append(Section(id: 1, name: "Sample Section: Grounds"))
    }
    
    
}
