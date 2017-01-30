//
//  ViewController.swift
//  HomeInspection
//
//  Created by Jared Speck on 12/7/16.
//  Copyright © 2016 Jared Speck. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    
    
    // Properties

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Prepare for leaving this controller, Instantiate state controller if new or continuing local inspection. (If the next view controller is an InspDetailsViewController)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showInspDetailsViewController") {
            let inspDetailsVC: InspDetailsViewController = segue.destination as! InspDetailsViewController
            
            print("Creating resultsDelegate (StateController) for inspDetailsVC")
            
            // Need to differentiate between new and continuing (for deciding on loading values or not)
            inspDetailsVC.resultsDelegate = StateController()
        }
    }

}

