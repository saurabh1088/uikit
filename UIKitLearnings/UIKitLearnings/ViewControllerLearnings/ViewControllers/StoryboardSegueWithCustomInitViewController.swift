//
//  StoryboardSegueWithCustomInitViewController.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 29/05/24.
//

import UIKit

class StoryboardSegueWithCustomInitViewController: UIViewController {

    private let message: String
    
    @IBOutlet weak var messageLabel: UILabel!
    
    init?(message: String, coder: NSCoder) {
        self.message = message
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = message
    }
}
