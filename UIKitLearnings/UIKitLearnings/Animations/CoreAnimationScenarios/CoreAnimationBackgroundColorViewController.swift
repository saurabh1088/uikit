//
//  CoreAnimationBackgroundColorViewController.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 31/07/24.
//

import UIKit

class CoreAnimationBackgroundColorViewController: UIViewController {

    @IBOutlet weak var targetView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func updateBackgroundColor(_ sender: Any) {
        targetView.layer.backgroundColor = UIColor.paletteYellow?.cgColor
    }
    
}
