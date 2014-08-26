//
//  MasterViewController.swift
//  BirdWatching
//
//  Created by bnrh29 on 2014/08/17.
//  Copyright (c) 2014年 bnrh29. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var dataController: BirdSightingDataController = BirdSightingDataController()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem.accessibilityHint = "Adds a new bird-sighting event"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowSightingDetails" {
            var detailViewController: DetailViewController = segue.destinationViewController as DetailViewController
            detailViewController.sighting = self.dataController.objectInListAtIndex(self.tableView.indexPathForSelectedRow().row)
        }
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataController.countOflist()
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let CellIdentifier: String = "BirdSightingCell"

        let formatter: NSDateFormatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        
        let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier) as UITableViewCell

        var sightingAtIndex: BirdSighting = self.dataController.objectInListAtIndex(indexPath.row)
        cell.textLabel.text = sightingAtIndex.name
        cell.detailTextLabel.text = formatter.stringFromDate(sightingAtIndex.date)
        
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    @IBAction func done(segue: UIStoryboardSegue){
        if segue.identifier == "ReturnInput" {
            var addController: AddSightingViewController = segue.sourceViewController as AddSightingViewController
            if addController.birdSighting != nil {
                self.dataController.addBirdSightingWithSighting(addController.birdSighting!)
                self.tableView.reloadData()
            }
            self.dismissViewControllerAnimated(true, nil)
        }
    }

    @IBAction func cancel(segue: UIStoryboardSegue){
        if segue.identifier == "CancelInput" {
            self.dismissViewControllerAnimated(true, nil)
        }
    }

}

