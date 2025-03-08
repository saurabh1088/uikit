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
    @IBOutlet weak var btnExampleOne: CustomizableButton!
    @IBOutlet weak var btnExampleTwo: CustomizableButton!
    
    // MARK: - Private Properties
    private var btnExampleThree: CustomizableButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        btnExampleOne.setupWith(title: "Button Example One",
                                   font: UIFont.systemFont(ofSize: 17),
                                   textColor: .red)
        btnExampleOne.applyBackground(.color(.yellow))
        
        btnExampleTwo.setupWith(title: "Button Example Two",
                                   font: UIFont.systemFont(ofSize: 17),
                                   textColor: .red)
        btnExampleTwo.applyBackground(.color(.yellow))
        
        let buttonFrame = CGRect(x: 8, y: 300, width: 200, height: 50)
        btnExampleThree = CustomizableButton(frame: buttonFrame,
                                                title: "Button Example Three",
                                                font: UIFont.systemFont(ofSize: 17),
                                                textColor: .red)
        guard let btnExampleThree else { return }
        btnExampleThree.applyBackground(.color(.yellow))
        self.view.addSubview(btnExampleThree)
    }
}
