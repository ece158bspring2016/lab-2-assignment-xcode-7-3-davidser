//
//  PlayersViewController.swift
//  Ratings
//
//  Created by David Serrano on 4/18/16.
//  Copyright © 2016 David Serrano. All rights reserved.
//

import UIKit

class PlayersViewController: UITableViewController {
    
    // Player array property to hold the list of players
    var players: [Player] = playersData
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return players.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            
        let cell = tableView.dequeueReusableCellWithIdentifier("PlayerCell", forIndexPath: indexPath)
            as! PlayerCellTableViewCell
            
        let player = players[indexPath.row] as Player
        cell.player = player
            
        return cell
            
    }
    
    @IBAction func cancelToPlayersViewController(segue:UIStoryboardSegue) {
    }
    
    // Obtains reference to PlayerDetailsViewController via the segue reference passed into the method
    // Uses this to add the new Player object to the array of player in the datasourcef
    @IBAction func savePlayerDetail(segue:UIStoryboardSegue) {
        if let playerDetailsViewController = segue.sourceViewController as? PlayerDetailsViewController {
            
            //add the new player to the players array
            if let player = playerDetailsViewController.player {
                players.append(player)
                
                //update the tableView
                let indexPath = NSIndexPath(forRow: players.count-1, inSection: 0)
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            }
        }
    }    
}
