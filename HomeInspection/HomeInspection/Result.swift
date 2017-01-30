//
//  Result.swift
//  HomeInspection
//
//  Created by Jared Speck on 1/29/17.
//  Copyright © 2017 Jared Speck. All rights reserved.
//

import UIKit

class Result {
    
    // Set on initialization (immutable)
    let id: Int32
    let inspectionId: Int32
    let commentId: Int32
    
    // Set when used (mutable)
    var severity: Int8
    var flags: [Int32]?
    var photoPath: String?
    
    // Result initializer
    init(id: Int32, inspectionId: Int32, commentId: Int32) {
        self.id = id
        self.inspectionId = inspectionId
        self.commentId = commentId
        
        self.flags = nil
        self.photoPath = nil
        self.severity = -1;
    }
}
