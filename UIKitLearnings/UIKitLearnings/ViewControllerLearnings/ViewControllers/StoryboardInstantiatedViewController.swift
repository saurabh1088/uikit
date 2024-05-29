//
//  StoryboardInstantiatedViewController.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 28/05/24.
//

import UIKit

class StoryboardInstantiatedViewController: UIViewController {

    var messageText: String!
    @IBOutlet weak var message: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        message.text = messageText
    }
}
