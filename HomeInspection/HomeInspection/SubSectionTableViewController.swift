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



class SubSectionTableViewController: UITableViewController {

    
    
    // Properties
    var subSections = [SubSection]()
    var numReuses = 0
    var resultsDelegate: StateController? = nil
    
    
    
    // Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register XIB reuse identifiers
        let sscell = UINib(nibName: "SubSectionHeaderViewCell", bundle: nil)
        tableView.register(sscell, forCellReuseIdentifier: "SubSectionHeaderViewCell")
        
        let ccell = UINib(nibName: "CommentViewCell", bundle: nil)
        tableView.register(ccell, forCellReuseIdentifier: "CommentViewCell")
        
        
        // Load sample subsections for testing
        loadSampleSubSections()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /* Set the number of section in the table
     * (= number of subsections for the chosen section)
     */
    override func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections
        return subSections.count
    }

    /* Set the number of rows per section
     * (Comments in a subsection + 1 for the subsection header)
     */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows
        return 5
    }

    /* Initialize Table Cells */
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
        debugPrint("Reused \(numReuses) Cells")
        
        /* Initialize cell with values based off of row number in section
         * (0 is subsection header cell, others are comment cells)
         */
        if (indexPath.row == 0) {
            // Downcast cell as subsection header cell
            let subSectionCell = cell as! SubSectionHeaderViewCell
            
            //initialize subsection cell values
            subSectionCell.subSectionLabel.text = "Subsection \(indexPath.section + 1)"
            subSectionCell.subSectionStatusLabel.text = "All clear for Subsection \(indexPath.section + 1)"
            
            return subSectionCell
        }
        else {
            // Downcast cell as comment cell
            let commentCell = cell as! CommentViewCell
            
            // Initialize comment cell values
            commentCell.commentTextButton.setAttributedTitle(NSMutableAttributedString(string: "Comment \(indexPath.row)", attributes: commentCell.commentTextAttributes), for: .normal)
            commentCell.commentId = 1
            commentCell.statusToggleAction = { (commentCell) in
                if (commentCell.resultId == nil) {
                    // Need to assign a comment id to the cell first...Then this creates and assigns the cell a resultId in the state controller's Reults array
                    commentCell.resultId = self.resultsDelegate?.userAddedResult(commentId: commentCell.commentId!)
                    
                    print("New comment found. Added an entry at index \(commentCell.resultId!) in the Results Array")
                }
                
                let isOn = commentCell.commentStatus.isOn
                commentCell.buttonHiddenWidths.priority = isOn ? 250 : 900
                commentCell.commentTextButton.isEnabled = isOn
                
            }
            commentCell.commentTextButtonTapAction = { (commentCell) in
                let newSeverity = (self.resultsDelegate?.userChangedSeverity(resultId: commentCell.resultId!))!
                print("Comment Tapped, updating severity for result \(commentCell.resultId!) to \(newSeverity)")
                commentCell.updateSeverity(severity: newSeverity)
            }
            
            return commentCell
        }
    }
    
    /* Sets the heights for the cells based off of index path
     * (0 = subsection header, others are comment cells)
     */
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row == 0) {
            return 96
        }
        else {
            return 64
        }
    }
    
    
    
    // Event Handlers

    
    
    
    
    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    // TESTING: Loads (3) sample subsections into table
    private func loadSampleSubSections() {
        guard let subSec1 = SubSection(subSectionId: 1, commentIds: [1, 4, 6])
            else {
                fatalError("subSec1 failed to initialize.")
        }
        
        guard let subSec2 = SubSection(subSectionId: 2, commentIds: [2, 3, 5])
            else {
                fatalError("subSec2 failed to initialize")
        }
        
        guard let subSec3 = SubSection(subSectionId: 3, commentIds: [0, 7, 8])
            else {
                fatalError("subSec3 failed to initialize")
        }
        
        subSections += [subSec1, subSec2, subSec3]
    }

}
