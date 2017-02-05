//
//  PaneViewCell.swift
//  HomeInspection
//
//  Created by Christian Coelho on 2/4/17.
//  Copyright © 2017 Jared Speck. All rights reserved.
//

import UIKit

class PaneViewCell: UITableViewCell {

    var sectionId: Int!
    
    @IBOutlet weak var sectionButton: UIButton!
    @IBOutlet weak var sectionLabel: UILabel!
    
    @IBAction func sectionButtonTap(_ sender: Any) {
        sectionButtonTapAction?(self)
    }

    var sectionButtonTapAction: ((PaneViewCell) -> Void)?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
