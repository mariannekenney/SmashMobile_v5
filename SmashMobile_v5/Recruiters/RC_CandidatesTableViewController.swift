//
//  RC_CandidatesTableViewController.swift
//  SmashMobile_v5
//
//  Created by Marianne Kenney on 6/6/18.
//  Copyright © 2018 SmashFly. All rights reserved.
//

import UIKit

class RC_CandidateTableViewCell: UITableViewCell {
    
    @IBOutlet weak var viewText: UITextView!
    
    @IBAction func starPressed(_ sender: UIButton) {
        if (sender.isStarred()) {
            print("Yes star")
        } else {
            print("No star")
        }
    }
}

class RC_CandidatesTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var selectButton: UIBarButtonItem!
    @IBOutlet weak var sortButton: UIBarButtonItem!
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    var selectOn: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setStyle(title: "(list name)")
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
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> RC_CandidateTableViewCell {
        let cell: RC_CandidateTableViewCell = tableView.dequeueReusableCell(withIdentifier: "candidatesCell", for: indexPath) as! RC_CandidateTableViewCell
        cell.viewText.setStyle(text: "Marianne Kenney (5/5)\n123.456.7890\nStonehill College\nJava, C, Swift\nInfo 1\nInfo 2\nInfo 3\nInfo 4\nInfo 5", size: 14.0)
        cell.viewText.isSelectable = false
        cell.tintColor = UIColor.MainColors.info
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (selectOn) {
            let cell = tableView.cellForRow(at: indexPath)
            if (cell?.accessoryType == .checkmark) {
                cell?.accessoryType = .disclosureIndicator
            } else {
                cell?.accessoryType = .checkmark
            }
        } else {
            performSegue(withIdentifier: "candidatesToIndividual", sender: self)
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            print("Delete")
        }
    }
    
   override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let infoAction = UIContextualAction(style: .normal, title:  "Yes", handler: { (ac: UIContextualAction, view: UIView, success:(Bool) -> Void) in
            let alert = UIAlertController(title: nil, message: "Send to", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "George Washington", style: .default, handler: {
                (alert: UIAlertAction!) -> Void in
                print("George Washington")
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                (alert: UIAlertAction!) -> Void in
                print("Cancel")
            }))
            self.present(alert, animated: true, completion: nil)
        })
        infoAction.title = "Send"
        infoAction.backgroundColor = UIColor.MainColors.info
        return UISwipeActionsConfiguration(actions: [infoAction])
    }
    
    @IBAction func backPressed(_ sender: Any) {
        if (selectOn) {
            let totalRows = tableView.numberOfRows(inSection: 0)
            for row in 0..<totalRows {
                tableView.cellForRow(at: IndexPath(row: row, section: 0))?.accessoryType = .disclosureIndicator
            }
            self.selectOn = false
            self.sortButton.title = "Sort"
            self.selectButton.title = "Select"
            self.backButton.title = "Back"
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func selectPressed(_ sender: Any) {
        if (selectOn) {
            let totalRows = tableView.numberOfRows(inSection: 0)
            for row in 0..<totalRows {
                tableView.selectRow(at: IndexPath(row: row, section: 0), animated: true, scrollPosition: .none)
            }
        } else {
            selectOn = true
            selectButton.title = "Select All"
            sortButton.title = "Send"
            backButton.title = "Cancel"
        }
    }
    
    @IBAction func filterPressed(_ sender: Any) {
        if (selectOn) {
            let alert = UIAlertController(title: nil, message: "Send to", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "George Washington", style: .default, handler: {
                (alert: UIAlertAction!) -> Void in
                self.selectOn = false
                self.sortButton.title = "Sort"
                self.selectButton.title = "Select"
                self.backButton.title = "Back"
                print("George Washington")
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                (alert: UIAlertAction!) -> Void in
                print("Cancel")
            }))
            self.present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: nil, message: "Sort by", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Favorites", style: .default, handler: {
                (alert: UIAlertAction!) -> Void in
                print("Favorites")
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
}
