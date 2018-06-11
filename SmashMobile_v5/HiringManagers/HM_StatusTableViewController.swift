//
//  HM_StatusTableViewController.swift
//  SmashMobile_v5
//
//  Created by Marianne Kenney on 6/7/18.
//  Copyright © 2018 SmashFly. All rights reserved.
//

import UIKit

class HM_StatusTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var persona: UILabel!
    @IBOutlet weak var status: UILabel!
    
    @IBAction func starPressed(_ sender: UIButton) {
        if (sender.isStarred()) {
            print("Yes star")
        } else {
            print("No star")
        }
    }
}

class HM_StatusTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTableStyle(title: "Day To Day")
        searchBar.setStyle()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> HM_StatusTableViewCell {
        let cell: HM_StatusTableViewCell = tableView.dequeueReusableCell(withIdentifier: "statusCell", for : indexPath) as! HM_StatusTableViewCell
        
        cell.name.setStyle(title: "Marianne Kenney", size: 17.0)
        cell.persona.setStyle(title: "Software Engineer", size: 14.0)
        cell.status.setStyle(title: "Sent to Hiring Manager", size: 16.0)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "statusToIndividual", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            print("Delete")
        }
    }
    
    @IBAction func sortPressed(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: "Sort by", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Favorites", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Favorites")
        }))
        alert.addAction(UIAlertAction(title: "Alphabetical", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Alphabetical")
        }))
        alert.addAction(UIAlertAction(title: "Most Recent", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Most Recent")
        }))
        alert.addAction(UIAlertAction(title: "Stage", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Stage")
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Cancel")
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
