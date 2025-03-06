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
        buttonExampleOne.applyBackground(.color(.yellow))
        
        buttonExampleTwo.setupWith(title: "Button Example Two",
                                   font: UIFont.systemFont(ofSize: 17),
                                   textColor: .red)
        buttonExampleTwo.applyBackground(.color(.yellow))
        
        let buttonExampleThree = CustomizableButton(frame: .init(x: 8, y: 300, width: 200, height: 50))
        buttonExampleThree.setupWith(title: "Button Example Three",
                                     font: UIFont.systemFont(ofSize: 17),
                                     textColor: .red)
        buttonExampleThree.applyBackground(.color(.yellow))
        self.view.addSubview(buttonExampleThree)
    }
}
