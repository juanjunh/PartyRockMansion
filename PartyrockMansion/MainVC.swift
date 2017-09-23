//
//  ViewController.swift
//  PartyrockMansion
//
//  Created by JanielHNY on 2017/9/12.
//  Copyright © 2017年 JanielHNY. All rights reserved.
//

import UIKit

// to build a tableview, these r the protocols u need to have at least:        1. UITableViewDelegate, 2. UITableViewDataSource, 3. cellForRowAtIndexPath, numberOfRows, and 4. tableView.delegate = self, tableView.dataSource = self



class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    var partyRocks = [PartyRock]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = PartyRock(imageURL: "https://i.ytimg.com/vi/nfWlot6h_JM/maxresdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/nfWlot6h_JM\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Shake it off")
        
        let p2 = PartyRock(imageURL: "https://i.ytimg.com/vi/lp-EO5I60KA/maxresdefault.jpg",videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/lp-EO5I60KA\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Thinking out loud")
        
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell  = tableView.dequeueReusableCellWithIdentifier("PartyCell", forIndexPath: indexPath) as? PartyCell {
            // remember to go back to main.storyboard and set identifier in the  attribute inspector of table cell
            
            let partyRock = partyRocks[indexPath.row]
            
            cell.updateUI(partyRock)
            
            return cell
            
        } else {
            return UITableViewCell() // when iOS recycles cells for user to use
        }
    
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let partyRock = partyRocks[indexPath.row]
        
        performSegueWithIdentifier("VideoVC", sender: partyRock)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let destination = segue.destinationViewController as? VideoVC {
            
            if let party = sender as? PartyRock{
                destination.partyRock = party
                
            }
        }
    }


}



