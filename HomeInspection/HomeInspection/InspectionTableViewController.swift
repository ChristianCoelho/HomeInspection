//
//  SubSectionTableViewController.swift
//  HomeInspection
//
//  Created by Jared Speck on 1/12/17.
//  Copyright © 2017 Jared Speck. All rights reserved.
//

import UIKit



protocol ResultDataDelegate {
    func userAddedResult(commentId: Int32) -> Int32
    func userRemovedResult(resultId: Int32) -> Int32
    func userChangedSeverity(resultId: Int32) -> Int8
    func userChangedNote(resultId: Int32, note: String) -> String
    func userChangedPhoto(resultId: Int32, photoPath: String) -> String
    func userChangedFlags(resultId: Int32, flagNums: [Int8]) -> [Int8]
}



class InspectionTableViewController: UITableViewController {

    
    
    /* Properties */
    
    var sectionId: Int!
    var subSections = [SubSection]()
    var numReuses = 0
    
    /* End of Properties */
    
    
    
    /* Table Initialization Functions */
    
    // Function called on loading the table view
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register table refresh notification
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "refresh"), object: nil, queue: nil, using: refreshTable)

        // Register XIB reuse identifiers
        let sscell = UINib(nibName: "SubSectionHeaderViewCell", bundle: nil)
        tableView.register(sscell, forCellReuseIdentifier: "SubSectionHeaderViewCell")
        
        let ccell = UINib(nibName: "CommentViewCell", bundle: nil)
        tableView.register(ccell, forCellReuseIdentifier: "CommentViewCell")
    }

    // Function called when too much memory has been used
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // REQUIRED: Set the number of sections in the table (= number of subsections for the chosen section)
    override func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections (demo value for now)
        return 4
    }

    // REQUIRED: Set the number of rows per section (Comments in a subsection + 1 for the subsection header)
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows (demo value for now)
        return 4
    }

    // REQUIRED: Initialize/Reuse table cells based on identifier
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var identifier: String
        
        // Set identifier based off row (0 is subsection header, all others are comments)
        if (indexPath.row == 0) {
            identifier = "SubSectionHeaderViewCell"
        }
        else {
            identifier = "CommentViewCell"
        }
        
        // Dequeue a reusable cell based off of identifier
        let cell = self.tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as UITableViewCell
        
        // Remove selection highlighting
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        // Reuse old cell
        numReuses += 1
        //debugPrint("Reused \(numReuses) Cells")
        
        // Initialize the cell based off of identifier
        if (identifier == "SubSectionHeaderViewCell") {
            // Downcast cell as subsection header cell
            let subSectionCell = cell as! SubSectionHeaderViewCell
            
            // Initialize subsection cell values
            initSubSectionCell(cell: subSectionCell, section: indexPath.section)
            
            return subSectionCell
        }
        else {
            // Downcast cell as comment cell
            let commentCell = cell as! CommentViewCell
            
            // Initialize comment cell values
            initCommentCell(cell: commentCell, section: indexPath.section, row: indexPath.row)
            
            return commentCell
        }
    }
    
    // Sets the heights for the cells based off row (0 is subsection header, all others are comments)
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row == 0) {
            return 64
        }
        else {
            // Min comment row size = 48. Any lower and the switches start to align weirdly and get hard to hit.
            return 48
        }
    }
    
    /* End of Table Initialization Functions */
    
    
    
    /* Helper Functions */
    
    // Initializes subsection cells with values loaded from the state controller
    func initSubSectionCell(cell: SubSectionHeaderViewCell, section: Int) {
        cell.subSectionLabel.text = "Subsection \(section + 1)"
        cell.subSectionStatusLabel.text = "All clear for Subsection \(section + 1)"
    }
    
    // Initializes comment cells with values loaded from the state controller
    func initCommentCell(cell: CommentViewCell, section: Int, row: Int) {
        let state = StateController.state
        var commentText: String
        
        // Translates the cells location into a comment id
        cell.commentId = Int32(state.getCommentId(section: 1, subSection: section + 1, row: row)!)
        
        // Gets the status of the comment with id commentId from the comment table
        //cell.commentStatus.setOn(state.getCommentState(commentId: Int(cell.commentId!)), animated: false)
        
        // Sets the comment addon button states based on the comment's status
        cell.buttonHiddenWidths.priority = cell.commentStatus.isOn ? 250 : 900
        cell.commentTextButton.isEnabled = cell.commentStatus.isOn
        
        // Sets the cell to display text on more than one line
        cell.commentTextButton.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        // Gets the plain comment text from the state controller
        commentText = state.getCommentText(commentId: Int(cell.commentId!))
        
        // Sets the comment text
        cell.commentTextButton.setAttributedTitle(NSMutableAttributedString(string: commentText, attributes: cell.commentTextAttributes), for: .normal)
        
        // Called when the comment status is toggled (or checked once we switch to checkboxes)
        cell.statusToggleAction = { (cell) in
            let isOn = cell.commentStatus.isOn
            
            // Adding a newly checked comment to the result array
            if (cell.resultId == nil && isOn) {
                // Need to assign a comment id to the cell first...
                cell.resultId = StateController.state.userAddedResult(commentId: cell.commentId!)
                
                print("New comment found. Added an entry at index \(cell.resultId!) in the Results Array")
            }
            
            // Show/hide comment addon buttons
            cell.buttonHiddenWidths.priority = isOn ? 250 : 900
            cell.commentTextButton.isEnabled = isOn
        }
        
        // Called when the comment text is tapped (to increase severity)
        cell.commentTextButtonTapAction = { (commentCell) in
            let newSeverity = (StateController.state.userChangedSeverity(resultId: commentCell.resultId!))
            print("Comment Tapped, updating severity for result \(commentCell.resultId!) to \(newSeverity)")
            commentCell.updateSeverity(severity: newSeverity)
        }
    }
    
    func refreshTable(notification: Notification) -> Void {
        print("Refreshing table")
        self.tableView.reloadData()
    }
    
    /* End of Helper Functions */
    

}
