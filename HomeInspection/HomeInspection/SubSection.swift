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
    var commentIds: [Int]!
    
    // MARK: - Initializer
    init!(subSectionId: Int!, commentIds: [Int]!) {
            
        // Initialize properties with given values
        self.subSectionId = subSectionId
        self.commentIds = commentIds
    }

}
