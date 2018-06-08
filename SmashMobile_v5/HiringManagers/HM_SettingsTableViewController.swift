//
//  HM_SettingsTableViewController.swift
//  SmashMobile_v5
//
//  Created by Marianne Kenney on 6/7/18.
//  Copyright © 2018 SmashFly. All rights reserved.
//

import UIKit

class HM_SettingsTableViewController: UITableViewController {
    
    @IBOutlet weak var pushLabel: UILabel!
    @IBOutlet weak var pushSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setStyle(title: "Settings")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let titles = ["My action items"]
        return titles[section]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for : indexPath)
        cell.textLabel?.setStyle(title: "Set up interview", size: 15.0)
        return cell
    }
    
    @IBAction func switchPressed(_ sender: Any) {
        print("SwitchPressed")
    }
}
