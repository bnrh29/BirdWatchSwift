//
//  BirdSightingDataController.swift
//  BirdWatching
//
//  Created by bnrh29 on 2014/08/18.
//  Copyright (c) 2014年 bnrh29. All rights reserved.
//

import UIKit

class BirdSightingDataController {
    var masterBirdSightingList: [BirdSighting] = [BirdSighting]()

    init(){
        self.initializeDefaultDataList()
    }

    func countOflist() -> Int {
        return self.masterBirdSightingList.count
    }
    
    func objectInListAtIndex(theIndex: Int) -> BirdSighting {
        return self.masterBirdSightingList[theIndex]
    }
    
    func addBirdSightingWithSighting(sighting: BirdSighting) {
        self.masterBirdSightingList.append(sighting)
    }

    func initializeDefaultDataList() {
        var sighting: BirdSighting
        var today: NSDate = NSDate()
        sighting = BirdSighting(name: "Pigeon", location:"EveryWhere", date: today)
        self.addBirdSightingWithSighting(sighting)
    }


}
