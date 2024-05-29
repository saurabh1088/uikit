//
//  NibInstantiatedViewController.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 28/05/24.
//

import UIKit

class NibInstantiatedViewController: UIViewController {

    private var message: String
    
    init(message: String) {
        self.message = message
        super.init(nibName: "NibInstantiatedViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = message
    }
}
