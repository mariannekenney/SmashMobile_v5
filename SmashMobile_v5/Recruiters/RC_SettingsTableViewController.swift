//
//  RC_SettingsTableViewController.swift
//  SmashMobile_v5
//
//  Created by Marianne Kenney on 6/6/18.
//  Copyright © 2018 SmashFly. All rights reserved.
//

import UIKit

class RC_SettingsTableViewController: UITableViewController {

    @IBOutlet weak var addHM: UIButton!
    @IBOutlet weak var pushSwitch: UISwitch!
    @IBOutlet weak var pushLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setStyle(title: "Settings")
        addHM.setStyle(size: 18.0)
        pushSwitch.setStyle()
        pushLabel.setStyle(title: "Allow push notifications?", size: 17.0)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let titles = ["My hiring managers", "Preview of candidates"]
        return titles[section]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for : indexPath)
        if (indexPath.section == 0) {
            cell.textLabel?.setStyle(title: "George Washington", size: 16.0)
        } else {
            cell.textLabel?.setStyle(title: "Education", size: 16.0)
        }
        cell.tintColor = UIColor.MainColors.info
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (tableView.cellForRow(at: indexPath)?.accessoryType == .none) {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            print("Delete")
        }
    }
    
    @IBAction func addHMPressed(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: "Sort by", preferredStyle: .alert)
        
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func pushSwitchPressed(_ sender: Any) {
        print("SwitchPressed")
    }
}
