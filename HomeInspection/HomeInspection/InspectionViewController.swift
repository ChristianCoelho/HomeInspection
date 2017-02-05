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
    @IBOutlet weak var sectionNameButton: UIButton!
    var sectionId: Int! = 1
    
    
    // Other Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        sectionNameButton.titleLabel?.text = StateController.state.sections[sectionId].sectionName
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "embedInspectionTableViewController") {
            let inspTableVC = segue.destination as! InspectionTableViewController
            inspTableVC.sectionId = self.sectionId
            print("Passing sectionId: \(self.sectionId!) to Inspection Table")
        }
    }
}
