//
//  PlayerDetailsViewController.swift
//  Ratings
//
//  Created by David Serrano on 5/7/16.
//  Copyright © 2016 David Serrano. All rights reserved.
//

import UIKit

class PlayerDetailsViewController: UITableViewController {
    
    var player:Player?
    
    // didSet will display the name of the team in the static table cell whenever the name changes
    var team: String = "Dodgers" {
        didSet {
            detailLabel.text? = team
        }
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var detailLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        print("init PlayerDetailsViewController")
        super.init(coder: aDecoder)
    }
    
    deinit {
        print("deinit PlayerDetailsViewController")
    }
    
    // Activate text field if the user taps the first cell
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            nameTextField.becomeFirstResponder()
        }
    }
    
    // Creates default values for team on segues that have the 
    // identifier of SavePlayerDetail
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SavePlayerDetail" {
            player = Player(name: nameTextField.text, team: team, rating: 1)
        }
        
        if segue.identifier == "PickTeam" {
            if let GamePickerViewController = segue.destinationViewController as? GamePickerViewController {
                GamePickerViewController.selectedTeam = team
            }
        }
    }
    
    // Unwind view after selecting team
    @IBAction func unwindWithSelectedTeam(segue:UIStoryboardSegue) {
        if let GamePickerViewController = segue.sourceViewController as? GamePickerViewController,
            selectedTeam = GamePickerViewController.selectedTeam {
            team = selectedTeam
        }
    }
}
