//
//  SubSection.swift
//  HomeInspection
//
//  Created by Jared Speck on 1/12/17.
//  Copyright © 2017 Jared Speck. All rights reserved.
//

import UIKit

class SubSection {

    // MARK: - Properties
    var subSectionId: Int!
    var sectionId: Int!
    var subSectionName: String!
    
    var commentIds: [Int]!
    
    // MARK: - Initializer
    init!(subSectionId: Int!, name: String!, sectionId: Int!) {
        
        print("Added subSeciton \(subSectionId!) to section: \(sectionId!)")
        // Initialize properties with given values
        self.subSectionId = subSectionId
        self.subSectionName = name
        self.sectionId = sectionId
        
        self.commentIds = [Int]()
        
    }

}
