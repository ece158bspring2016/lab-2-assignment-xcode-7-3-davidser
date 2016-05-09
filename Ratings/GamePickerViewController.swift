//
//  GamePickerViewController.swift
//  Ratings
//
//  Created by David Serrano on 5/8/16.
//  Copyright © 2016 David Serrano. All rights reserved.
//

import UIKit

class GamePickerViewController: UITableViewController {
    
    var teams:[String] = [
        "Dodgers", "Mets", "Cubs", "Red Sox", "Giants", "Angels", "Yankees"]
    
    // Whenever selectedTeam is updated, it will locate the team string in teams array and 
    // automatically update selectedGameIdnex with the correct index into the table
    var selectedTeam: String? {
        didSet {
            if let team = selectedTeam {
                selectedTeamIndex = teams.indexOf(team)!
            }
        }
    }
    
    var selectedTeamIndex:Int?

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return teams.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TeamCell", forIndexPath: indexPath)
        
        // Configure cell to display contents of teams array
        cell.textLabel?.text = teams[indexPath.row]
        
        // Sets checkmark on selected teams
        if indexPath.row == selectedTeamIndex {
            cell.accessoryType = .Checkmark
        }
        else {
            cell.accessoryType = .None
        }
        
        return cell
    }
    
    // Called by the Table View delegate whenever the user taps a row
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        //Other row is selected - need to deselect it
        if let index = selectedTeamIndex {
            let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: index, inSection: 0))
            cell?.accessoryType = .None
        }
        
        selectedTeam = teams[indexPath.row]
        
        //update the checkmark for the current row
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.accessoryType = .Checkmark
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        // The sender parameter si the objected that initiated the segue (selected team cell)
        // You can use that cell's indexPath to locate the selected team in teams then set selectedTeam
        // so that it is available in the unwind segue
        if segue.identifier == "SaveSelectedTeam" {
            if let cell = sender as? UITableViewCell {
                let indexPath = tableView.indexPathForCell(cell)
                if let index = indexPath?.row {
                    selectedTeam = teams[index]
                }
            }
        }
    }
}
