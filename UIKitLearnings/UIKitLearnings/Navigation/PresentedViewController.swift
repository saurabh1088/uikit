//
//  PresentedViewController.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 21/05/24.
//

import UIKit

class PresentedViewController: UIViewController {

    @IBOutlet weak var presentAgainButton: UIButton!
    
    @IBOutlet weak var dismissButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func presentButtonAction(_ sender: Any) {
        let viewController = NavigationTestViewController(nibName: "NavigationTestViewController", bundle: nil)
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true)
    }
    
    
    @IBAction func dismissButtonAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
