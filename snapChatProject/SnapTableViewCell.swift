//
//  SnapTableViewCell.swift
//  snapChatProject
//
//  Created by Junyu Wang on 3/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class SnapTableViewCell: UITableViewCell {

    @IBOutlet weak var readStatusImageView: UIImageView!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var postedTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
