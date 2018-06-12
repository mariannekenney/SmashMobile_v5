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
        self.setTableStyle(title: "Software Engineer")
        searchBar.setStyle()
        searchBar.isHidden = true
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
        tableView.cellForRow(at: indexPath)?.isSelected = false
        if (selectOn) {
            let cell = tableView.cellForRow(at: indexPath)
            var circle: UIImageView
            circle = UIImageView(frame:CGRect(x: 200, y: 75, width: 25, height: 25))
            circle.image = UIImage(named:"circle.png")
            var check: UIImageView
            check = UIImageView(frame:CGRect(x: 200, y: 75, width: 25, height: 25))
            check.image = UIImage(named:"check.png")
            
            if (cell?.accessoryView == check) {
                cell?.accessoryView = circle
            } else {
                cell?.accessoryView = check
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
            self.setEditing(false, animated: true)
        })
        infoAction.title = "Send"
        infoAction.backgroundColor = UIColor.MainColors.info
        return UISwipeActionsConfiguration(actions: [infoAction])
    }
    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if (searchBar.isHidden) {
            searchBar.isHidden = false
        } else {
            searchBar.isHidden = true
        }
    }
    
    @IBAction func backPressed(_ sender: Any) {
        if (selectOn) {
            let totalRows = tableView.numberOfRows(inSection: 0)
            for row in 0..<totalRows {
                tableView.cellForRow(at: IndexPath(row: row, section: 0))?.accessoryType = .disclosureIndicator
                tableView.cellForRow(at: IndexPath(row: row, section: 0))?.isSelected = false
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
        var accessory: UIImageView
        accessory = UIImageView(frame:CGRect(x: 200, y: 75, width: 25, height: 25))
        accessory.image = UIImage(named: "check.png")
        if (!selectOn) {
            print("Hello222")
            selectOn = true
            selectButton.title = "Select All"
            sortButton.title = "Send"
            backButton.title = "Cancel"
            //accessory.image = UIImage(named:"circle.png")
        }
        let totalRows = tableView.numberOfRows(inSection: 0)
        for row in 0..<totalRows {
            tableView.cellForRow(at: IndexPath(row: row, section: 0))?.accessoryView = accessory
            print("setting")
        }
        print("done")
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
