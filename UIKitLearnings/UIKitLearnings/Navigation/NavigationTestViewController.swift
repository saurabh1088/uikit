//
//  NavigationTestViewController.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 21/05/24.
//

import UIKit

class NavigationTestViewController: UIViewController {
    
    @IBOutlet weak var dismissButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func dismissButtonAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
