//
//  MessageCell.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 24/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var messageBubble: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var anyViewRight: UIView!
    @IBOutlet weak var anyView: UIView!
    @IBOutlet weak var any: UILabel!
    @IBOutlet weak var anyR: UILabel!
    override func awakeFromNib() {
        //TableViewItem
        super.awakeFromNib()
        messageBubble.layer.cornerRadius = messageBubble.frame.size.height / 5
        anyView.layer.cornerRadius =
        anyView.frame.size.height / 2
        anyViewRight.layer.cornerRadius =
        anyViewRight.frame.size.height / 2
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

     
    }
    
}
