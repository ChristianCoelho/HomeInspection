//
//  InspInfoViewController.swift
//  HomeInspection
//
//  Created by Jared Speck on 1/11/17.
//  Copyright © 2017 Jared Speck. All rights reserved.
//

import UIKit

class InspDetailsViewController: UIViewController {
    
    
    
    // Properties
    var resultsDelegate: StateController? = nil
    
    
    
    // Other Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showInspectionViewController") {
            let inspectionVC: InspectionViewController = segue.destination as! InspectionViewController
            
            print("Passing resultsDelegate (StateController) from inspDetailsVC to inspectionVC")
            
            inspectionVC.resultsDelegate = self.resultsDelegate
        }
        else if (segue.identifier == "embedPaneTableViewControllerInInspDetails") {
            let paneTableVC: PaneTableViewController = segue.destination as! PaneTableViewController
            
            if (paneTableVC.resultsDelegate == nil) {
                print("Passing resultsDelegate (StateController) from inspDetailsVC to embedded paneTableVC")
            
                paneTableVC.resultsDelegate = self.resultsDelegate
            }
        }
    }
    
}

