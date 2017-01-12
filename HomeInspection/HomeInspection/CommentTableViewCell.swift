//
//  CommentTableViewCell.swift
//  HomeInspection
//
//  Created by Jared Speck on 1/12/17.
//  Copyright © 2017 Jared Speck. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    //MARK: Properties
    @IBOutlet weak var statusText: UILabel!
    @IBOutlet weak var subSecName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
