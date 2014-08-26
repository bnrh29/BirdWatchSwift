//
//  AddSightingViewController.swift
//  BirdWatching
//
//  Created by bnrh29 on 2014/08/22.
//  Copyright (c) 2014年 bnrh29. All rights reserved.
//

import UIKit

class AddSightingViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var birdNameInput: UITextField!
    @IBOutlet weak var locationInput: UITextField!

    var birdSighting: BirdSighting?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        if textField == self.birdNameInput || textField == self.locationInput {
            textField.resignFirstResponder()
        }
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if segue.identifier == "ReturnInput" {
            if !self.birdNameInput.text.isEmpty || !self.locationInput.text.isEmpty {
                var today: NSDate = NSDate()
                var sighting: BirdSighting = BirdSighting(name: self.birdNameInput.text, location: self.locationInput.text, date: today)
                self.birdSighting = sighting
            }
        }
    }
}
