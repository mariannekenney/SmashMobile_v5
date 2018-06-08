//
//  RC_IndividualViewController.swift
//  SmashMobile_v5
//
//  Created by Marianne Kenney on 6/6/18.
//  Copyright © 2018 SmashFly. All rights reserved.
//

import UIKit

class RC_IndividualViewController: UIViewController {
    
    @IBOutlet weak var openStatus: UIButton!
    @IBOutlet weak var viewText: UITextView!
    @IBOutlet weak var viewResume: UIButton!
    @IBOutlet weak var starButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var status: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setStyle(title: "(individual)")
        status.setStyle(title: "Status of individual", size: 18.0)
        openStatus.setStyle(size: 14.0)
        viewResume.setStyle(size: 14.0)
        viewText.setStyle(text: "I\nN\nF\nO\nR\nM\nA\nT\nI\nO\nN\n!!", size: 15.0)
    }
    
    @IBAction func openStatusPressed(_ sender: Any) {
        print("OpenStatus")
    }
    
    @IBAction func commentPressed(_ sender: Any) {
        print("Comment")
    }
    
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func viewResumePressed(_ sender: Any) {
        print("ViewResume")
    }
    
    @IBAction func starPressed(_ sender: UIButton) {
        if (sender.isStarred()) {
            print("Yes star")
        } else {
            print("No star")
        }
    }
}
