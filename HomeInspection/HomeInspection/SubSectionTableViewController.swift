//
//  SubSectionTableViewController.swift
//  HomeInspection
//
//  Created by Jared Speck on 1/12/17.
//  Copyright © 2017 Jared Speck. All rights reserved.
//

import UIKit

class SubSectionTableViewController: UITableViewController {

    // MARK: - Properties
    var subSections = [SubSection]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections
        return subSections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows
        return 3
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell
        
        NSLog("Trouble Ahead")
        
        // Populate table with subsections and comments
        //if (indexPath.row == 0) {
            if let subSectionCell = tableView.dequeueReusableCell(withIdentifier: "SubSectionTableViewCell") as? SubSectionTableViewCell {
                cell = subSectionCell
            }
            else {
                fatalError("cannot reuse ssec")
            }
        /*}
        else {
            if let commentCell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell", for: indexPath) as? CommentTableViewCell {
                cell = commentCell
            }
            else {
                fatalError("Cannot reuse comment")
            }
        }*/

        NSLog("Good Reuse :)")
        
        // Configure the cell...
        //let subSection = subSections[indexPath.row]

        //cell.subSectionName.text = "Testing"
        
        return cell
    }
    
    // Override to change the name of the headers for each section (the subsection name for each list of comments)
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Test Header"
    }

    
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
