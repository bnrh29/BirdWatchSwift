//
//  BirdSighting.swift
//  BirdWatching
//
//  Created by bnrh29 on 2014/08/18.
//  Copyright (c) 2014年 bnrh29. All rights reserved.
//

import UIKit

class BirdSighting {
    var name: String
    var location: String
    var date: NSDate
    
    init (name: String, location: String, date:NSDate) {
        self.name = name
        self.location = location
        self.date = date
    }
}