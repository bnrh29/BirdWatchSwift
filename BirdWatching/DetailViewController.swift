//
//  DetailViewController.swift
//  BirdWatching
//
//  Created by bnrh29 on 2014/08/17.
//  Copyright (c) 2014年 bnrh29. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {
                            
    @IBOutlet weak var birdNameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    var sighting: BirdSighting?

    func configureView() {
        var theSighting: BirdSighting? = self.sighting
        let formatter: NSDateFormatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        
        if let tempSighting = theSighting {
            self.birdNameLabel.text = tempSighting.name
            self.locationLabel.text = tempSighting.location
            self.dateLabel.text = formatter.stringFromDate(tempSighting.date)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

