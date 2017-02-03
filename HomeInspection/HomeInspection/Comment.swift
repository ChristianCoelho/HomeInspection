//
//  Comment.swift
//  HomeInspection
//
//  Created by Jared Speck on 1/12/17.
//  Copyright © 2017 Jared Speck. All rights reserved.
//

import UIKit

class Comment {
    
    //MARK: Properties
    private var commentId: Int!
    private var subSectionId: Int!
    private var sectionId: Int!
    private var defaultFlags: [Int8]!
    
    // Read only
    private(set) var commentText: String!
    private(set) var rank: Int?
    private(set) var active: Bool! = false
 
    //MARK: Initialization
    init!(commentId: Int!, subSectionId: Int!, section: Int!, commentText: String!, defaultFlags: [Int8]!, active: Bool) {
 
        // Initialize comment properties
        self.commentId = commentId
        self.subSectionId = subSectionId
        self.commentText = commentText
        self.defaultFlags = defaultFlags
        self.active = active
    
    }
}
