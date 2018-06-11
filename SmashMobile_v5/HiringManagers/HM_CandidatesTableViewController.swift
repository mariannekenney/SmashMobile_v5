//
//  HM_CandidatesTableViewController.swift
//  SmashMobile_v5
//
//  Created by Marianne Kenney on 6/7/18.
//  Copyright © 2018 SmashFly. All rights reserved.
//

import UIKit

class HM_CandidateTableViewCell: UITableViewCell {
    
    @IBOutlet weak var viewText: UITextView!
    
    @IBAction func starPressed(_ sender: UIButton) {
        if (sender.isStarred()) {
            print("Yes star")
        } else {
            print("No star")
        }
    }
}

class HM_CandidatesTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTableStyle(title: "Software Engineer")
        searchBar.setStyle()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> HM_CandidateTableViewCell {
        let cell: HM_CandidateTableViewCell = tableView.dequeueReusableCell(withIdentifier: "candidatesCell", for: indexPath) as! HM_CandidateTableViewCell
        cell.viewText.setStyle(text: "Marianne Kenney (5/5)\n123.456.7890\nStonehill College\nJava, C, Swift\n\n\nalsfkdjalksjd", size: 14.0)
        cell.viewText.isSelectable = false
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "candidatesToIndividual", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let yesAction = UIContextualAction(style: .normal, title:  "Yes", handler: { (ac: UIContextualAction, view: UIView, success:(Bool) -> Void) in
            self.actionSteps()
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
    
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func filterPressed(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: "Sort by", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Favorites", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Favorites")
        }))
        alert.addAction(UIAlertAction(title: "Decision", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Decision")
        }))
        alert.addAction(UIAlertAction(title: "Alphabetical", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Alphabetical")
        }))
        alert.addAction(UIAlertAction(title: "Tags", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Tags")
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Cancel")
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

