//
//  CommentViewCell.swift
//  HomeInspection
//
//  Created by Jared Speck on 1/27/17.
//  Copyright © 2017 Jared Speck. All rights reserved.
//

import UIKit

class CommentViewCell: UITableViewCell {

    
    // Properties
    var commentId: Int32? = nil
    var resultId: Int32? = nil
    var commentTextAttributes: [String : Any] = [
        NSFontAttributeName : UIFont.systemFont(ofSize: 16.0),
        NSForegroundColorAttributeName : UIColor.lightText,
        NSUnderlineStyleAttributeName : 0]
    
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
    
    
    
    // Functions
    
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
    
    // Changes comment text appearance based off of its severity (value passed in from the state controller)
    func updateSeverity(severity: Int8) {
        print("Updating view for result \(self.resultId) to match severity \(severity)")
        
        let oldText: String = (commentTextButton.titleLabel?.text)!
        var newText: NSMutableAttributedString
        
        switch (severity) {
        case 0:
            commentTextAttributes[NSUnderlineStyleAttributeName] = 0
            commentTextAttributes[NSFontAttributeName] = UIFont.systemFont(ofSize: 16)
            newText = NSMutableAttributedString(string: oldText, attributes: commentTextAttributes)
            commentTextButton.setAttributedTitle(newText, for: .normal)
            break;
        case 1:
            commentTextAttributes[NSUnderlineStyleAttributeName] = 1
            commentTextAttributes[NSFontAttributeName] = UIFont.systemFont(ofSize: 16)
            newText = NSMutableAttributedString(string: oldText, attributes: commentTextAttributes)
            commentTextButton.setAttributedTitle(newText, for: .normal)
            break;
        case 2:
            commentTextAttributes[NSUnderlineStyleAttributeName] = 1
            commentTextAttributes[NSFontAttributeName] = UIFont.boldSystemFont(ofSize: 16)
            newText = NSMutableAttributedString(string: oldText, attributes: commentTextAttributes)
            commentTextButton.setAttributedTitle(newText, for: .normal)
            break;
        default:
            print("Comment with resultId \(self.resultId) updated with bad severity value \(severity)")
        }
    }
    
}
