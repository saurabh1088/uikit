//
//  StoryboardSegueViewController.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 28/05/24.
//

import UIKit

class StoryboardSegueViewController: UIViewController {

    /// Trying to add a initializer here for setting this property will require to add required initializer `init?(coder: NSCoder)`
    /// As `StoryboardSegueViewController` is part of a storyboard and is pushed via a storyboard
    /// segue, it is instantiated by calling `init?(coder: NSCoder)` which will cause issue if it is implemented
    /// while implementing a custom initializer by providing implementation like `fatalError("init(coder:) has not been implemented")`
    ///
    /// This problem will not come had `StoryboardSegueViewController` not been in a storyboard,
    /// instead had it been using a nib file. For example see the implementation done in `NibInstantiatedViewController`
    var message: String!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = message
    }
}
