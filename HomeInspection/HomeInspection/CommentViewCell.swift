//
//  CommentViewCell.swift
//  HomeInspection
//
//  Created by Jared Speck on 1/27/17.
//  Copyright © 2017 Jared Speck. All rights reserved.
//

import UIKit

class CommentViewCell: UITableViewCell {

    
    // MARK - Properties
    @IBOutlet weak var commentStatus: UISwitch!
    @IBOutlet weak var commentTextButton: UIButton!
    @IBOutlet weak var commentNotesButton: UIButton!
    @IBOutlet weak var commentFlagsButton: UIButton!
    @IBOutlet weak var commentPhotoButton: UIButton!
    @IBAction func statusToggle(_ sender: Any) {
        statusToggleAction?(self)
    }
    @IBAction func commentTextButtonTap(_ sender: Any) {
        commentTextButtonTapAction?(self)
    }
    @IBOutlet weak var buttonHiddenWidths: NSLayoutConstraint!
    
    // Closure variable for cell events (set by table's controller during cell init)
    var statusToggleAction: ((CommentViewCell) -> Void)?
    var commentTextButtonTapAction: ((CommentViewCell) -> Void)?
    
    // MARK - Functions
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
