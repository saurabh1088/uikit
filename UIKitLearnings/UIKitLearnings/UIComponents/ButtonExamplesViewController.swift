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
        setupXIBButtons()
        setupProgrammaticButtons()
    }
    
    private func setupXIBButtons() {
        configure(button: btnExampleOne, forExample: .one)
        configure(button: btnExampleTwo, forExample: .two)
    }
    
    private func setupProgrammaticButtons() {
        createButtonThree()
    }
    
    private func configure(button: CustomizableButton?, forExample example: ButtonsExample) {
        guard let button else { return }
        button.setupWith(title: example.title,
                         font: example.font,
                         textColor: example.textColor)
        button.applyBackground(example.backgroundType)
    }
    
    private func createButtonThree() {
        let buttonFrame = CGRect(x: 8, y: 300, width: 200, height: 50)
        btnExampleThree = CustomizableButton(frame: buttonFrame,
                                                title: "Button Example Three",
                                                font: UIFont.systemFont(ofSize: 17),
                                                textColor: .red)
        guard let btnExampleThree else { return }
        btnExampleThree.applyBackground(.color(.yellow))
        self.view.addSubview(btnExampleThree)
    }
    
    private func addConstraintsForButtonThree() {
        guard let button = btnExampleThree else { return }
        button.translatesAutoresizingMaskIntoConstraints = false
        
    }
}
