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
    var comText: String!
    var severity: Int8!
 
    //MARK: Initialization
    init!(comText: String!, severity: Int8!) {
 
        // Initialize comment properties
        self.comText = comText
        self.severity = severity
    }
}
