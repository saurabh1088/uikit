//
//  ButtonExamplesViewController.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 04/03/25.
//

import UIKit
import SwiftUIKitLib

class ButtonExamplesViewController: UIViewController {

    @IBOutlet weak var buttonExampleOne: CustomizableButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonExampleOne.setupWith(title: "Test title",
                                   font: UIFont.systemFont(ofSize: 17),
                                   textColor: .red)
        // TODO: Fix issue as this button background image isn't visible.
        buttonExampleOne.applyBackgroundColor(.image(UIImage(systemName: "seal.fill")!))
    }
}
