//
//  ButtonExamplesViewController.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 04/03/25.
//

import UIKit
import SwiftUIKitLib

/// This view controller demonstrates various uses of CustomizableButton.
class ButtonExamplesViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var buttonExampleOne: CustomizableButton!
    @IBOutlet weak var buttonExampleTwo: CustomizableButton!
    
    // MARK: - Private Properties
    private var buttonExampleThree: CustomizableButton?

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
        
        let buttonFrame = CGRect(x: 8, y: 300, width: 200, height: 50)
        buttonExampleThree = CustomizableButton(frame: buttonFrame,
                                                title: "Button Example Three",
                                                font: UIFont.systemFont(ofSize: 17),
                                                textColor: .red)
        guard let buttonExampleThree else { return }
        buttonExampleThree.applyBackground(.color(.yellow))
        self.view.addSubview(buttonExampleThree)
    }
}
