//
//  InspectionViewController.swift
//  HomeInspection
//
//  Created by Jared Speck on 1/30/17.
//  Copyright © 2017 Jared Speck. All rights reserved.
//

import UIKit

class InspectionViewController: UIViewController {

    
    
    // Properties
    var resultsDelegate: StateController? = nil
    
    
    
    // Other Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "embedInspectionTableViewController") {
            let inspTableVC: SubSectionTableViewController = segue.destination as! SubSectionTableViewController
            
            print("Passing resultsDelegate (StateController) from inspectionVC to embedded inspectionTableVC")
            
            inspTableVC.resultsDelegate = self.resultsDelegate
        }
        else if (segue.identifier == "embedPaneTableViewControllerInInspection") {
            let paneTableVC: PaneTableViewController = segue.destination as! PaneTableViewController
            
            if (paneTableVC.resultsDelegate == nil) {
                print("Passing resultsDelegate (StateController) from inspectionVC to embedded paneTableVC")
                
                paneTableVC.resultsDelegate = self.resultsDelegate
            }
        }
    }
    
    

}
