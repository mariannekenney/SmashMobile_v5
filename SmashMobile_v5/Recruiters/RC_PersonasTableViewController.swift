//
//  RC_PersonasTableViewController.swift
//  SmashMobile_v5
//
//  Created by Marianne Kenney on 6/6/18.
//  Copyright © 2018 SmashFly. All rights reserved.
//

import UIKit

class RC_PersonasTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setStyle(title: "Personas")
        searchBar.setStyle()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "personaCell", for : indexPath)
        cell.textLabel?.setStyle(title: "Sales Rep", size: 17.0)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "personasToCandidates", sender: self)
    }
    
    @IBAction func addPressed(_ sender: Any) {
        
    }
}
