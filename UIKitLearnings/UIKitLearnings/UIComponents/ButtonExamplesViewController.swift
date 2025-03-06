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
    @IBOutlet weak var buttonExampleTwo: CustomizableButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        buttonExampleOne.setupWith(title: "Button Example One",
                                   font: UIFont.systemFont(ofSize: 17),
                                   textColor: .red)
        buttonExampleOne.applyBackground(.image(UIImage(named: "folder")!))
        
        buttonExampleTwo.setupWith(title: "Button Example Two",
                                   font: UIFont.systemFont(ofSize: 17),
                                   textColor: .red)
        buttonExampleTwo.applyBackground(.image(UIImage(systemName: "seal.fill")!))
    }
}
