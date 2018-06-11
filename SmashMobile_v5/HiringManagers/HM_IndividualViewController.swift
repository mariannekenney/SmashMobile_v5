//
//  HM_IndividualViewController.swift
//  SmashMobile_v5
//
//  Created by Marianne Kenney on 6/7/18.
//  Copyright © 2018 SmashFly. All rights reserved.
//

import UIKit

class HM_IndividualViewController: UIViewController {
    
    @IBOutlet weak var viewResume: UIButton!
    @IBOutlet weak var viewText: UITextView!
    @IBOutlet weak var openStatus: UIButton!
    @IBOutlet weak var takeAction: UIButton!
    @IBOutlet weak var segment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViewStyle(title: "Marianne Kenney")
        segment.setStyle(color: UIColor.MainColors.secondary, size: 18.0)
        openStatus.setStyle(size: 14.0)
        takeAction.setStyle(size: 14.0)
        viewResume.setStyle(size: 14.0)
        viewText.setStyle(text: "Marianne Kenney (5/5)\n123.456.7890\nStonehill College\nJava, C, Swift\nInfo 1\nInfo 2\nInfo 3\nInfo 4\nInfo 5\nI\nN\nF\nO\nR\nM\nA\nT\nI\nO\nN\n!!", size: 15.0)
    }
    
    @IBAction func starPressed(_ sender: UIButton) {
        if (sender.isStarred()) {
            print("Yes star")
        } else {
            print("No star")
        }
    }
    
    @IBAction func takeActionPressed(_ sender: Any) {
        self.actionSteps()
    }
    
    @IBAction func viewResumePressed(_ sender: Any) {
        print("ViewResume")
    }
    
    @IBAction func statusLogPressed(_ sender: Any) {
        print("StatusLog")
    }
    
    @IBAction func backPressed(_ sender: Any) {
        handleSaving()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func commentPressed(_ sender: Any) {
        print("Comment")
    }
    
    func handleSaving() {
        print("Saving data")
    }
}
