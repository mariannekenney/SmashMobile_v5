//
//  HM_InboxTableViewController.swift
//  SmashMobile_v5
//
//  Created by Marianne Kenney on 6/7/18.
//  Copyright © 2018 SmashFly. All rights reserved.
//

import UIKit

class HM_InboxTableViewCell: UITableViewCell {
    
    @IBOutlet weak var viewText: UITextView!
    
    @IBAction func starPressed(_ sender: UIButton) {
        if (sender.isStarred()) {
            print("Yes star")
        } else {
            print("No star")
        }
    }
}

class HM_InboxTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setStyle(title: "Inbox")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let titles = ["Software Engineer", "QA Engineer"]
        return titles[section]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> HM_InboxTableViewCell {
        let cell: HM_InboxTableViewCell = tableView.dequeueReusableCell(withIdentifier: "candidatesCell", for: indexPath) as! HM_InboxTableViewCell
        cell.viewText.setStyle(text: "Marianne Kenney (5/5)\n123.456.7890\nStonehill College\nJava, C, Swift\n\n\nalsfkdjalksjd", size: 14.0)
        cell.viewText.isSelectable = false
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "inboxToIndividual", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            print("Delete")
        }
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let yesAction = UIContextualAction(style: .normal, title:  "Yes", handler: { (ac: UIContextualAction, view: UIView, success:(Bool) -> Void) in
            print("Yes")
            self.setEditing(false, animated: true)
        })
        yesAction.title = "Yes"
        yesAction.backgroundColor = UIColor.MainColors.success
        return UISwipeActionsConfiguration(actions: [yesAction])
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let noAction = UIContextualAction(style: .normal, title:  "Yes", handler: { (ac: UIContextualAction, view: UIView, success:(Bool) -> Void) in
            print("No")
            self.setEditing(false, animated: true)
        })
        noAction.title = "No"
        noAction.backgroundColor = UIColor.MainColors.danger
        return UISwipeActionsConfiguration(actions: [noAction])
    }
    
}


