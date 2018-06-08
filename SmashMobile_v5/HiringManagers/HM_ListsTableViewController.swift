//
//  HM_ListsTableViewController.swift
//  SmashMobile_v5
//
//  Created by Marianne Kenney on 6/7/18.
//  Copyright © 2018 SmashFly. All rights reserved.
//

import UIKit

class HM_ListsTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setStyle(title: "Lists")
        searchBar.setStyle()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "listsCell", for : indexPath)
        cell.textLabel?.setStyle(title: "Software Engineer", size: 17.0)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "listsToCandidates", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            print("Delete")
        }
    }
}
