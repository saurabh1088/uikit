//
//  StoryboardSegueViewController.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 28/05/24.
//

import UIKit

class StoryboardSegueViewController: UIViewController {

    var message: String!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = message
    }
}
