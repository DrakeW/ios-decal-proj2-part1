//
//  SnapPost.swift
//  snapChatProject
//
//  Created by Junyu Wang on 3/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import Foundation
import UIKit

class SnapPost {
    var image: UIImage?
    var readStatus: Bool?
    var postedTime: Date?
    var postedBy: String?
    
    init(with image: UIImage, from author: String) {
        self.image = image
        self.postedBy = author
        self.readStatus = false
        self.postedTime = Date(timeIntervalSinceNow: 0)
    }
}
