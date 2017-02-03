//
//  PaneViewController.swift
//  HomeInspection
//
//  Created by Jared Speck on 12/7/16.
//  Copyright © 2016 Jared Speck. All rights reserved.
//

import UIKit

class PaneViewController: UIViewController {

    
    
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
        if (segue.identifier == "embedPaneTableViewController") {
            let paneTableVC: PaneTableViewController = segue.destination as! PaneTableViewController
            
            if (paneTableVC.resultsDelegate == nil) {
                print("Passing resultsDelegate (StateController) from paneVC to embedded paneTableVC")
                
                paneTableVC.resultsDelegate = self.resultsDelegate
            }
        }
    }
 

}
